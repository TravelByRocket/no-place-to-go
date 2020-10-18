//
//  NFCViewController.swift
//  NFC
//
//  Created by Purkylin King on 2019/10/10.
//  Copyright © 2019 Purkylin King. All rights reserved.
//

import UIKit
import CoreNFC
import SwiftUI

class NFCViewController: UIViewController {
    @Binding var tagMessage: String
    var session: NFCReaderSession?

    init(tagMessage: Binding<String>) {
        _tagMessage = tagMessage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let readBtn = createButton(title: "Scan")
        readBtn.addTarget(self, action: #selector(btnReadClicked), for: .touchUpInside)
        view.addSubview(readBtn)
                
        view.backgroundColor = .black
    }

    @objc func btnReadClicked() {
        print("read")
        ready(write: false)
    }
    
    func ready(write: Bool = false) {
        let mode = write ? "write" : "read"
        
        guard NFCNDEFReaderSession.readingAvailable else {
            let alertController = UIAlertController(
                title: "Scanning Not Supported",
                message: "This device doesn't support tag scanning.",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
            present(alertController, animated: true, completion: nil)
            return
        }
        
        session = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: false)
        
        session?.alertMessage = "Hold your iPhone near an tag to \(mode) the message."
        session?.begin()
    }
    
    func showError(_ errorMessage: String) {
        let alertController = UIAlertController(
            title: "Session Invalidated",
            message: errorMessage,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showResult(record: NFCNDEFPayload) {
        tagMessage = record.body ?? "no tag message body found"
    }
    
    deinit {
        if let session = session {
            if session.isReady {
                session.invalidate()
            }
        }
    }
    
    func output(record: NFCNDEFPayload) {
        switch record.typeNameFormat {
        case .empty:
            return
        case .absoluteURI:
            if let url = record.wellKnownTypeURIPayload() {
                print(url)
            }
        case .nfcWellKnown:
            let (info, _) = record.wellKnownTypeTextPayload()
            if let info = info {
                print(info)
            }
        case .unknown:
            print("Unknown data")
        default:
            print("other")
        }
    }
}

extension NFCViewController: NFCNDEFReaderSessionDelegate {
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        print("active")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        if let readerError = error as? NFCReaderError {
            if readerError.code == .readerSessionInvalidationErrorSystemIsBusy {
                showError("System busy")
            }
            print(readerError.localizedDescription)

        }
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        //
        if let message = messages.first {
            if let record = message.records.first {
                output(record: record)
                session.invalidate()
                showResult(record: record)

            }
        }
    }
}

extension NFCViewController: NFCTagReaderSessionDelegate {
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("tag active")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        if let readerError = error as? NFCReaderError {
            if readerError.code == .readerSessionInvalidationErrorSystemIsBusy {
                showError("System busy")
            }
            print(readerError.localizedDescription)

        }
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        // https://swifting.io/blog/2019/07/11/53-first-steps-with-nfc-on-ios-13/
        
        print("ok tag")
        guard let tag = tags.first else { return }
        
        // mifare
        if case .miFare(let mifareTag) = tag {
            print("mifare", mifareTag)
            
            if mifareTag.mifareFamily == .ultralight {
                //
            } else if mifareTag.mifareFamily == .unknown {
                // 14443
            } else {
                // Do nothing
            }
            
            session.connect(to: tag) { error in
                if error != nil {
                    print(error!.localizedDescription)
                    session.invalidate(errorMessage: "Application failure")
                    return
                }
                
                let apdu = NFCISO7816APDU(instructionClass: 0, instructionCode: 0xB0, p1Parameter: 0, p2Parameter: 0, data: Data(), expectedResponseLength: 16)
                
                mifareTag.sendMiFareISO7816Command(apdu) { (data, sw1, sw2, error) in
                    guard error != nil else {
                        print(error!.localizedDescription)
                        session.invalidate(errorMessage: "Application failure")
                        return
                    }
                    
                    print("ok data", data)
                    session.invalidate()
                }
            }
        }
    }
}

extension NFCNDEFPayload {
    var body: String? {
        switch self.typeNameFormat {
        case .nfcWellKnown:
            let (info, _) = self.wellKnownTypeTextPayload()
            return info
        case .absoluteURI:
            let url = self.wellKnownTypeURIPayload()
            return url?.absoluteString
        default:
            return nil
        }
    }
}


func createButton(title: String) -> UIButton {
    let btn = UIButton(type: .system)
    btn.setTitle(title, for: .normal)
    btn.setTitleColor(UIColor.black, for: .normal)
    btn.backgroundColor = UIColor.white
    btn.layer.cornerRadius = 6
    btn.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.heightAnchor.constraint(equalToConstant: 32).isActive = true
    return btn
}

//
//  ScanResultView.swift
//  NFC
//
//  Created by Purkylin King on 2019/10/10.
//  Copyright © 2019 Purkylin King. All rights reserved.
//

import SwiftUI
import CoreNFC

struct ScanResultView: View {
    let record: NFCNDEFPayload?
    let dismiss: (() -> Void)?
    
    init(record: NFCNDEFPayload?, dismiss: (() -> Void)?) {
        self.record = record
        self.dismiss = dismiss
    }
    
    var body: some View {
        if record?.body != nil {
            Text(record!.body!)
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

struct ScanResultView_Previews: PreviewProvider {
    static var previews: some View {
        ScanResultView(record: nil, dismiss: nil)
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

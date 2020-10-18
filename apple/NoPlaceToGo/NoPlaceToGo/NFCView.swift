//
//  NFCView.swift
//  NFC
//
//  Created by Purkylin King on 2019/10/10.
//  Copyright © 2019 Purkylin King. All rights reserved.
//

import SwiftUI

// How to set up @Binding with UIKit view https://stackoverflow.com/questions/59143053/how-to-execute-a-function-in-a-uiviewcontroller-through-a-swiftui-button
// Integrate NFC with SwiftUI https://github.com/purkylin/NFCTool

struct NFCView: View {
    @Binding var scannedMsg: String
    var body: some View {
        ContentViewController(tagMessage: $scannedMsg)
    }
}

struct ContentViewController: UIViewControllerRepresentable {
    @Binding var tagMessage: String
    
    func makeCoordinator() -> ContentViewController.Coordinator {
        Coordinator()
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return NFCViewController(tagMessage: $tagMessage)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //
    }
    
    func updateCurrentPage(sender: ContentViewController) {
        tagMessage = sender.tagMessage
    }
    
    class Coordinator : NSObject {
        
    }
    
}

struct NFCView_Previews: PreviewProvider {
    static var previews: some View {
        NFCView(scannedMsg: .constant("placeholder"))
    }
}

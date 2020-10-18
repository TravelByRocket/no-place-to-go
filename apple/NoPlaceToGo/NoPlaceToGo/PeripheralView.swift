//
//  PeripheralView.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/26/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PeripheralView: View {
    @Binding var scannedMsg: String
    @Binding var sentMsg: String
    @Binding var hasSubscriber: Bool
    var body: some View {
        PeripheralContentViewController(scannedMsg: $scannedMsg, sentMsg: $sentMsg, hasSubscriber: $hasSubscriber)
    }
}

struct PeripheralContentViewController: UIViewControllerRepresentable {
    @Binding var scannedMsg: String
    @Binding var sentMsg: String
    @Binding var hasSubscriber: Bool
    
    func makeCoordinator() -> PeripheralContentViewController.Coordinator {
        Coordinator()
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return PeripheralViewController(tagMessage: $scannedMsg, sentMessage: $sentMsg, hasSubscriber: $hasSubscriber)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
    
    class Coordinator : NSObject {
        
    }
}

//
//  PeripheralView.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/26/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PeripheralView: View {
    @Binding var msg: String
    var body: some View {
        PeripheralContentViewController(tagMessage: $msg)
    }
}

struct PeripheralContentViewController: UIViewControllerRepresentable {
    @Binding var tagMessage: String
    
    func makeCoordinator() -> PeripheralContentViewController.Coordinator {
        Coordinator()
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return PeripheralViewController(tagMessage: $tagMessage)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
    
    class Coordinator : NSObject {
        
    }
}

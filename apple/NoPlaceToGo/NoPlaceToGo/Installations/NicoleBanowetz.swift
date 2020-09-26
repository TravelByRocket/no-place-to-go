//
//  NicoleBanowetz.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI
import CoreNFC

struct NicoleBanowetz: View {
    @State var message = "Placeholder"
    var body: some View {
        VStack {
            Text(message)
            Spacer()
            NFCView(msg: $message)
            Spacer()
            PeripheralView(msg: $message)
        }
    }
    
}

struct NicoleBanowetz_Previews: PreviewProvider {
    static var previews: some View {
        NicoleBanowetz()
    }
}

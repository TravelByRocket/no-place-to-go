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
    @State var showSheet = false
    
    var body: some View {
        NFCView()
    }
    
}

struct NicoleBanowetz_Previews: PreviewProvider {
    static var previews: some View {
        NicoleBanowetz()
    }
}

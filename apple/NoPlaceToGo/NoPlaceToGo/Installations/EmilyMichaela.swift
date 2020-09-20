//
//  EmilyMichaela.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct EmilyMichaela: View {
    
   @State private var canProceed = false
    
    var body: some View {
        VStack {
            if !canProceed {
                PhaseOne(canProceed: $canProceed)
            } else {
                PhaseTwo()
            }
        }
    }
}

struct EmilyMichaela_Previews: PreviewProvider {
    static var previews: some View {
        EmilyMichaela()
    }
}

//
//  EmilyMichaela.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct EmilyMichaela: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int

    @State private var canProceed = false

    var body: some View {
        VStack {
            if !canProceed {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        LetSomethingGo(canProceed: $canProceed)
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                ScanningBio(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            }
        }
    }
}

struct EmilyMichaela_Previews: PreviewProvider {
    static var previews: some View {
        EmilyMichaela(installIndex: .constant(1), numInstallsAtSite: 1)
    }
}

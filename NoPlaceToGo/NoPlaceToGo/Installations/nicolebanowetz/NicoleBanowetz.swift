//
//  NicoleBanowetz.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct NicoleBanowetz: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    @State private var screenIndex: Int = 0
    
    var body: some View {
        if (screenIndex == 0) {
            Screen01BeforeProceeding(screenIndex: $screenIndex)
        } else if (screenIndex == 1) {
            Screen02Trust(screenIndex: $screenIndex)
        } else if (screenIndex == 2) {
            Screen03HumanOrMachine(screenIndex: $screenIndex)
        } else if (screenIndex == 3) {
            Screen04OutsideForce(screenIndex: $screenIndex)
        } else if (screenIndex == 4) {
            Screen05InterfaceWithMedium(screenIndex: $screenIndex)
        } else if (screenIndex == 5) {
            Screen06ProceedInterfaceMedium(screenIndex: $screenIndex)
        } else if (screenIndex == 6) {
            Screen07MeetMachine(screenIndex: $screenIndex)
        } else if (screenIndex == 7) {
            Screen08HaveRecorded(screenIndex: $screenIndex)
        } else if (screenIndex == 8) {
            Screen09FinalMaterialization(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
        }
    }
}

struct NicoleBanowetz_Previews: PreviewProvider {
    @State static private var site = 0

    static var previews: some View {
        NicoleBanowetz(installIndex: $site, numInstallsAtSite: 9)
    }
}

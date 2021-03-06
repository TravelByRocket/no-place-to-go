//
//  LamarB.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct LamarA: View {
    @State private var installIndex = 0
    private var numInstallsAtSite = 3
    @EnvironmentObject private var pm: ProgressManager
    
    var body: some View {
        VStack{
            if installIndex == 0 {
                NicoleBanowetz(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            } else if (installIndex == 1) {
                NolanTredway()
                NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            } else {
                NextSitePage()
            }
//            NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
        }
    }
}

struct LamarB_Previews: PreviewProvider {
    static var previews: some View {
        LamarB()
    }
}

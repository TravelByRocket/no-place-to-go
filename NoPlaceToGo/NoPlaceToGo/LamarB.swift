//
//  LamarA.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct LamarB: View {
    @State private var installIndex = 0
    private var numInstallsAtSite = 3
    
    var body: some View {
        VStack{
            if installIndex == 0 {
                StevenFrost()
                NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite, messageNext: "Liberace is\nfinished with me")
            } else if (installIndex == 1) {
                ChrissyGrace(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            } else {
                NextSitePage()
            }
        }
    }
    
    
}

struct LamarA_Previews: PreviewProvider {
    static var previews: some View {
        LamarA()
    }
}

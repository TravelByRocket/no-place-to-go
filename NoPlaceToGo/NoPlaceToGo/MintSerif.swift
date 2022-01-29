//
//  MintSerif.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct MintSerif: View {
    @State private var installIndex = 0
    private var numInstallsAtSite = 3

    var body: some View {
        VStack {
            if installIndex == 0 {
                MoeGraham(installIndex: $installIndex)
            } else if installIndex == 1 {
                HayleyKrichels(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            } else {
                ReadyForNextSiteView()
            }
        }
    }
}

struct MintSerif_Previews: PreviewProvider {
    static var previews: some View {
        MintSerif()
    }
}

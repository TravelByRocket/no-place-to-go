//
//  MusicRange.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct MusicRange: View {
    @State private var installIndex = 0
    private var numInstallsAtSite = 2

    var body: some View {
        VStack {
            if installIndex == 0 {
                EmilyMichaela(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            } else {
                ReadyForNextSiteView()
            }
        }
    }
}

struct MusicRange_Previews: PreviewProvider {
    static var previews: some View {
        MusicRange()
    }
}

//
//  Tootsies.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct Tootsies: View {
    @State private var installIndex = 0
    private var numInstallsAtSite = 2
    @EnvironmentObject private var pm: ProgressManager
    
    var body: some View {
        VStack{
            if (installIndex == 0) {
                ReneeHayleyD(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            } else {
                NextSitePage()
            }
        }
    }
}

struct Tootsies_Previews: PreviewProvider {
    static var previews: some View {
        Tootsies()
    }
}

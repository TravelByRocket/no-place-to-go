//
//  SiteWrapper.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/3/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct SiteWrapper: View {
    @EnvironmentObject private var pm: ProgressManager
    
    var body: some View {
        if (pm.inTransitToSite) {
            SiteTransition()
        } else if (pm.curSite == .LamarA) {
            LamarA()
        } else if (pm.curSite == .LamarB) {
            LamarB()
        } else if (pm.curSite == .MintSerif) {
            MintSerif()
        } else if (pm.curSite == .MusicRange) {
            MusicRange()
        } else if (pm.curSite == .Tootsies) {
            Tootsies()
        } else if (pm.curSite == .MintSerifFinal) {
            AllCompleted()
        }
    }
}

struct SiteWrapper_Previews: PreviewProvider {
    static var previews: some View {
        SiteWrapper()
    }
}

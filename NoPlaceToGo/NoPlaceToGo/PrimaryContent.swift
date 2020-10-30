//
//  HomePage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PrimaryContent: View {
    @EnvironmentObject var pm: ProgressManager
    
    var body: some View {
        if (pm.carGroup == nil) {
            StartPage()
        } else {
            CurrentSite()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryContent().environmentObject(ProgressManager())
    }
}

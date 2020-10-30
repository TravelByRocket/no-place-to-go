//
//  HomePage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct MainPage: View {
    @EnvironmentObject var pm: ProgressManager
    
    var body: some View {
        if (pm.carGroup == nil) {
            EnterGroupPassword()
//        } else if (pm.completions.hasCompletedAllSites) {
//            AllCompleted()
        } else {
            SiteWrapper()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage().environmentObject(ProgressManager())
    }
}

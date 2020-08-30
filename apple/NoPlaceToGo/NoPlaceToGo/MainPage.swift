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
        VStack {
            if pm.curSite != nil {
                Button(action: {
                    self.pm.setLocation(to: nil)
                }) {
                Text("Go Back TEMPORARY")
                }
            }
            viewFromEnum(site: pm.curSite)
        }
    }
    
    func viewFromEnum(site: Sites?) -> AnyView {
        switch site {
        case .LamarA:
            return AnyView(LamarA())
        case .LamarB:
            return AnyView(LamarB())
        case .MintSerif:
            return AnyView(MintSerif())
        case .MusicRange:
            return AnyView(MusicRange())
        case .Tootsies:
            return AnyView(Tootsies())
        default:
            return AnyView(EnterGroupPassword())
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage().environmentObject(ProgressManager())
    }
}

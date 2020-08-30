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
            return AnyView(Text("Placeholder"))
        case .LamarB:
            return AnyView(Text("Placeholder"))
        case .MintSerif:
            return AnyView(Text("Placeholder"))
        case .MusicRange:
            return AnyView(Text("Placeholder"))
        case .Tootsies:
            return AnyView(Text("Placeholder"))
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

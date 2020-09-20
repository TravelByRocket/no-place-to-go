//
//  LamarA.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct LamarA: View {
    let site = AddressedSite.lamarA
    
    @EnvironmentObject private var pm: ProgressManager
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    Text("Site: \(site.name)")
                    Button(action: {
                        self.site.getDirections()
                    }) {
                        Text("Get directions OPENS EXTERNAL MAP")
                    }
                    
                    Button(action: {
                        print("nothing yet")
                    }) {
                        Text("I have arrived ACTIVATES EXPERIENCE")
                    }
                    
                    // more elegant solutions didn't work but this seems fine
//                    ForEach (0 ..< site.artists.count) {i in
//                        Text(self.site.artists[i].rawValue)
//                    }
                    
                    NavigationLink(destination: StevenFrost()) {
                        Text("Steven — Audio played before seeing his piece")
                        
                    }
                    NavigationLink(destination: ChrissyGrace()) {
                        Text("Chrissy and Grace — App “crashes”, plays background sound, Maybe 3-minute countdown timer to when the app comes back. ")
                    }
                    
                    NavigationLink(destination: BAGBAYSHA()) {
                        Text("Thomas, Koko, Chris — Simple additional information to installation")
                    }
                    
                    Button(action: {
                        self.pm.setLocation(to: self.site.nextLocation)
                    }) {
                        Text("Go to next site")
                    }
                }
            }
        }
    }
}

struct LamarA_Previews: PreviewProvider {
    static var previews: some View {
        LamarA()
    }
}

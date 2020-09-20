//
//  MintSerif.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct MintSerif: View {
    let site = AddressedSite.mintSerif
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
                        self.site.getDirections()
                    }) {
                        Text("I have arrived ACTIVATES EXPERIENCE")
                    }
                    
                    // more elegant solutions didn't work but this seems fine
//                    ForEach (0 ..< site.artists.count) {i in
//                        Text(self.site.artists[i].rawValue)
//                    }
                    
                    NavigationLink(destination: MoeGraham()) {
                        Text("Moe — Clown's audio story, notifications throughout experience")
                    }
                    
                    NavigationLink(destination: HayleyKrichels()) {
                        Text("Hayley K — images later sent with notification")
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

struct MintSerif_Previews: PreviewProvider {
    static var previews: some View {
        MintSerif()
    }
}

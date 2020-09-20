//
//  Tootsies.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct Tootsies: View {
    let site = AddressedSite.tootsies
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
                    
                    NavigationLink(destination: ReneeHayleyD()) {
                    Text("Renee, Hayley — Phone waiting room")
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

struct Tootsies_Previews: PreviewProvider {
    static var previews: some View {
        Tootsies()
    }
}

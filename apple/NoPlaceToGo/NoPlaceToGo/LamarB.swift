//
//  LamarB.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct LamarB: View {
    let site = AddressedSite.lamarB
    var body: some View {
        VStack {
            List {
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
                ForEach (0 ..< site.artists.count) {i in
                    Text(self.site.artists[i].rawValue)
                }
                
                Text("Nicole — we are in contact")
                Text("Nolan — Four sculptural body parts that are alien to us. Each visitor picks one and that moves them to a room and then each member has a different experience. App could have instructions about how to choose an object. Or Frankie suggested maybe it could be a 360-degree documentation of each object. ")
            }
        }
    }
}

struct LamarB_Previews: PreviewProvider {
    static var previews: some View {
        LamarB()
    }
}

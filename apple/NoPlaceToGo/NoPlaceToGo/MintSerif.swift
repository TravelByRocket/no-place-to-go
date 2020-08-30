//
//  MintSerif.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct MintSerif: View {
    let site = AddressedSite.mintSerif
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
                
                Text("Moe — Chaos is the theme. When you think you’re done you’re back in it. Maybe clown with two performers. Maybe something about clown spottings in the app. Maybe something like amber alerts that throw you off and are jarring. Moe will compose sounds and narrative. Clowns may leave items throughout the physical space and could be cool if they also leave things around the app. Might have interaction ")
                Text("Hayley K — Almost three photo booth elements that people will walk or drive into. Could be audio prompts for the photo booth in the app. Is it possible to save the images in the app. ")
            }
        }
    }
}

struct MintSerif_Previews: PreviewProvider {
    static var previews: some View {
        MintSerif()
    }
}

//
//  LamarA.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct LamarA: View {
    let site = AddressedSite.lamarA
    var body: some View {
        VStack {
            List {
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
                ForEach (0 ..< site.artists.count) {i in
                    Text(self.site.artists[i].rawValue)
                }
                
                Text("Steven — Historical. Sound and text context for people entering the space. Maybe the sound starts playing in the previous location to have them overlap and speed up overall progress. ")
                Text("Chrissy and Grace — App “crashes” on arrival perhaps. Site is about sleep paralysis. Static or white noise on the phones all at once maybe. Maybe 3-minute countdown to when the app comes back. ")
                Text("Thomas, Koko, Chris — Very different styles in one place. Maybe no interaction in this area. Maybe an image or sequence that layers the aesthetics of the three artists. ")
            }
        }
    }
}

struct LamarA_Previews: PreviewProvider {
    static var previews: some View {
        LamarA()
    }
}

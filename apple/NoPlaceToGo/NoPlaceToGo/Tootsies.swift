//
//  Tootsies.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct Tootsies: View {
    let site = AddressedSite.tootsies
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
                
                Text("Renee, Hayley — Start audio once entering, a soundscape. A welcome voice and waiting room music. Automated phone call where it’s Press 1 for this and Press 2 for this and annoying and forever and interactive. When on the way to that space a scheduling reminder something like your appointment is in 1 minutes even when five minutes away. They would like to do AR vision on posters that are installed at the site. They were thinking of just buying a service that will make the phone calls. Ideally the push notification at least and then if we can then also have it attach the photo. ")
            }
        }
    }
}

struct Tootsies_Previews: PreviewProvider {
    static var previews: some View {
        Tootsies()
    }
}

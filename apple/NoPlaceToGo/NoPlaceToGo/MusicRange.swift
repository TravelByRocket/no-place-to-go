//
//  MusicRange.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct MusicRange: View {
    let site = AddressedSite.musicRange
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
                
                Text("Emily, Michaela — Enter bio info that will be sent to some retriever that changes an LED sign and has pre-programmed saying. ")
            }
        }
    }
}

struct MusicRange_Previews: PreviewProvider {
    static var previews: some View {
        MusicRange()
    }
}

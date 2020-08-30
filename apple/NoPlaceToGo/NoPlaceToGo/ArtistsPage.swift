//
//  ArtistsPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ArtistsPage: View {
    @EnvironmentObject var pm: ProgressManager
    
    var body: some View {
        List (artistbios.shuffled()) {artist in
            NavigationLink(destination: ArtistPage(artist: artist)) {
                ArtistRow(artist: artist)
            }
            
        }
        .navigationBarTitle("Artists")
    }
}

struct ArtistsPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArtistsPage()
        }
    }
}

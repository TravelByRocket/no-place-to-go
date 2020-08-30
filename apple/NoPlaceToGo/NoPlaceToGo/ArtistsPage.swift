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
    
    let artists: [Artists] = [.NicoleBanowetz, .Nolan, .HayleyK, .Renee_HayleyD, .Chrissy_Grace, .Emily_Michaela, .MoeGram, .StevenFrost]
    var body: some View {
        List (artists, id: \.self) {artist in
            Text(artist.rawValue)
        }
        .navigationBarTitle("Artists")
    }
}

struct ArtistsPage_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsPage()
    }
}

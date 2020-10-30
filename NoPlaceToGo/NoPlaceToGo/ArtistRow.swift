//
//  ArtistRow.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/30/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ArtistRow: View {
    let artist: artistbio
    var body: some View {
        HStack {
            ForEach (0..<artist.images.count) {index in
                artist.images[index]
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70)
                    .clipped()
            }
            Text(artist.name)
                .padding(.leading)
        }
    }
}

struct ArtistRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArtistsPage()
        }
    }
}

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
            artist.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .padding(.trailing)
            Text(artist.name)
                .font(.title)
//                .foregroundColor(Color("PinkHeadings"))
        }
    }
}

struct ArtistRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ArtistRow(artist: artistbios.randomElement()!)
            ArtistRow(artist: artistbios.randomElement()!)
            ArtistRow(artist: artistbios.randomElement()!)
            ArtistRow(artist: artistbios.randomElement()!)
        }
    }
}

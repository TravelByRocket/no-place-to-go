//
//  ArtistPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/30/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ArtistPage: View {
    let artist: artistbio
    var body: some View {
        List {
            VStack(alignment: .center) {
                ForEach (0..<artist.images.count) {index in
                    artist.images[index]
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                Text(artist.name)
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.Notable, size: 28))
                    .foregroundColor(Color("PinkHeadings"))
                Text(artist.pronouns)
                    .font(.custom(fonts.ZCOOL, size: 18))
                    .foregroundColor(Color("Gold"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
            }
            Text(artist.bio)
                .font(.custom(fonts.ZCOOL, size: 20))
                .padding(.horizontal)
            ForEach (0 ..< artist.urls.count) {i in
                Button(action: {
                    UIApplication.shared.open(URL(string:"http://\(self.artist.urls[i])")!)
                }) {
                    Text(self.artist.urls[i])
                }
            }
        }
    }
}

struct ArtistPage_Previews: PreviewProvider {
    static var previews: some View {
        ArtistPage(artist: artistbio.allartists.randomElement()!)
    }
}

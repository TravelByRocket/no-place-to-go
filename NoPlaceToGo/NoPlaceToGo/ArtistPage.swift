//
//  ArtistPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/30/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ArtistPage: View {
    let artist: ArtistBio

    var body: some View {
        List {
            VStack(alignment: .center) {
                // workaround since image not Hashable or Identifiable
                ForEach(0..<artist.images.count) {index in
                    artist.images[index]
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                Text(artist.name)
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.Notable, size: 28))
                    .foregroundColor(Color("PinkHeadings"))
                Text(artist.pronouns)
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.ZCOOL, size: 18))
                    .foregroundColor(Color("Gold"))
                    .padding(.bottom)
            }
            Text(artist.bio)
                .font(.custom(fonts.ZCOOL, size: 20))
                .padding(.horizontal)
            ForEach(artist.urls, id: \.self) {url in
                Button {
                    UIApplication.shared.open(URL(string: "http://\(url)")!)
                } label: {
                    Text(url)
                }
            }
        }
    }
}

struct ArtistPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArtistPage(artist: ArtistBio.allartists.randomElement()!)
        }
    }
}

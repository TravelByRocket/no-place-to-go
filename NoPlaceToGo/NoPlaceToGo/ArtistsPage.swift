//
//  ArtistsPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ArtistsPage: View {
    @EnvironmentObject var pm: ProgressManager // swiftlint:disable:this identifier_name

    var body: some View {
        List {
            Section(header: Text("Co-Directors")) {
                ForEach(ArtistBio.alldirectors) {director in
                    NavigationLink(destination: ArtistPage(artist: director)) {
                        ArtistRow(artist: director)
                    }
                }
            }

            Section(header: Text("Artists")) {
                ForEach(ArtistBio.allartists) {artist in
                    NavigationLink(destination: ArtistPage(artist: artist)) {
                        ArtistRow(artist: artist)
                    }
                }
            }

            Section(header: Text("Sound Design")) {
                NavigationLink(destination: ArtistPage(artist: ArtistBio.mike)) {
                    ArtistRow(artist: ArtistBio.mike)
                }
            }

            Section(header: Text("App Design")) {
                NavigationLink(destination: ArtistPage(artist: ArtistBio.bryan)) {
                    ArtistRow(artist: ArtistBio.bryan)
                }
            }

            Section(header: Text("Narration")) {
                NavigationLink(destination: ArtistPage(artist: ArtistBio.james)) {
                    ArtistRow(artist: ArtistBio.james)
                }
            }

            Section(header: Text("360 Degree Video Editing")) {
                NavigationLink(destination: ArtistPage(artist: ArtistBio.max)) {
                    ArtistRow(artist: ArtistBio.max)
                }
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

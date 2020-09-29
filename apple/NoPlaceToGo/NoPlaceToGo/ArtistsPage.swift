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
        List {
            Section(header: Text("Co-Directors")) {
                ForEach (artistbio.alldirectors) {director in
                    NavigationLink(destination: ArtistPage(artist: director)) {
                        ArtistRow(artist: director)
                    }
                }
            }
            
            Section(header: Text("Artists")) {
                ForEach (artistbio.allartists) {artist in
                    NavigationLink(destination: ArtistPage(artist: artist)) {
                        ArtistRow(artist: artist)
                    }
                }
            }
            
            Section(header: Text("Sound Design")) {
                NavigationLink(destination: ArtistPage(artist: artistbio.mike)) {
                    ArtistRow(artist: artistbio.mike)
                }
            }
            
            Section(header: Text("App Design")) {
                NavigationLink(destination: ArtistPage(artist: artistbio.bryan)) {
                    ArtistRow(artist: artistbio.bryan)
                }
            }
            
            Section(header: Text("Narration")) {
                NavigationLink(destination: ArtistPage(artist: artistbio.james)) {
                    ArtistRow(artist: artistbio.james)
                }
            }
            
            Section(header: Text("360 Degree Video Editing")) {
                NavigationLink(destination: ArtistPage(artist: artistbio.max)) {
                    ArtistRow(artist: artistbio.max)
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

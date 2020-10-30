//
//  InstallationPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/8/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct InstallationPage: View {
    let installation: installations
    var body: some View {
        Text(installation.title)
            .multilineTextAlignment(.center)
            .font(.custom(fonts.Notable, size: 28))
            .foregroundColor(Color("PinkHeadings"))
        List {
            Text(installation.description)
                .font(.custom(fonts.ZCOOL, size: 20))
                .padding(.horizontal)
            NavigationLink(
                destination: ArtistPage(artist: installation.artist),
                label: {
                    Text(installation.artist.name)
                })
        }
    }
}

struct InstallationPage_Previews: PreviewProvider {
    static var previews: some View {
        InstallationPage(installation: installations.clownhouse)
    }
}

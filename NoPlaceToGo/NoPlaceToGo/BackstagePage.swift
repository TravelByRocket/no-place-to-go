//
//  MoreInfo.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct BackstagePage: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ArtistsPage()) {
                    Text("Artists")
                }
                NavigationLink(destination: InstallationsPage()) {
                    Text("Installations")
                }
                NavigationLink(destination: PartnersPage()) {
                    Text("Partners & Funders")
                }
                NavigationLink(destination: AboutPage()) {
                    Text("About")
                }
                NavigationLink(destination: DonatePage()) {
                    Text("Donate")
                }
                NavigationLink(destination: HelpPage()) {
                    Text("Help")
                }
            }
            .navigationBarTitle("Backstage")
        }
    }
}

struct MoreInfo_Previews: PreviewProvider {
    static var previews: some View {
        BackstagePage()
    }
}

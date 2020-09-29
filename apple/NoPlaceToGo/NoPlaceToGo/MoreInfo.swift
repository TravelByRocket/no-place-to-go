//
//  MoreInfo.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct MoreInfo: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: SettingsPage()) {
                    Text("Settings")
                }
                NavigationLink(destination: ArtistsPage()) {
                    Text("Artists")
                }
                NavigationLink(destination: PartnersPage()) {
                    Text("Partners & Funders")
                }
                NavigationLink(destination: AboutPage()) {
                    Text("About")
                }
            }
            .navigationBarTitle("Backstage")
        }
    }
}

struct MoreInfo_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfo()
    }
}

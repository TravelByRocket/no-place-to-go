//
//  InstallationsPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/8/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct InstallationsPage: View {
    var body: some View {
        List {
            Section(header: Text("A Liberace Dream")) {
                NavigationLink(
                    destination: InstallationPage(installation: installations.liberace),
                    label: {
                        Text(installations.liberace.title)
                    })
                
                NavigationLink(
                    destination: InstallationPage(installation: installations.sleepparalysis),
                    label: {
                        Text(installations.sleepparalysis.title)
                    })
                
                NavigationLink(
                    destination: InstallationPage(installation: installations.saltpepperghosts),
                    label: {
                        Text(installations.saltpepperghosts.title)
                    })
            }
            Section(header: Text("The Surveillance Spa")) {
                NavigationLink(
                    destination: InstallationPage(installation: installations.interveningsubstance),
                    label: {
                        Text(installations.interveningsubstance.title)
                    })
                
                NavigationLink(
                    destination: InstallationPage(installation: installations.solidsjustfluids),
                    label: {
                        Text(installations.solidsjustfluids.title)
                    })
            }
            Section(header: Text("The Waiting Room")) {
                NavigationLink(
                    destination: InstallationPage(installation: installations.waitingroom),
                    label: {
                        Text(installations.waitingroom.title)
                    })
            }
            Section(header: Text("Data Assimilation Base")) {
                NavigationLink(
                    destination: InstallationPage(installation: installations.dreamsoldwholesale),
                    label: {
                        Text(installations.dreamsoldwholesale.title)
                    })
            }
            Section(header: Text("The Overwhelm")) {
                NavigationLink(
                    destination: InstallationPage(installation: installations.clownhouse),
                    label: {
                        Text(installations.clownhouse.title)
                    })
                
                NavigationLink(
                    destination: InstallationPage(installation: installations.photobooth),
                    label: {
                        Text(installations.photobooth.title)
                    })
            }
            Section(header: Text("NP2G Musical Score")) {
                NavigationLink(
                    destination: InstallationPage(installation: installations.musicscore),
                    label: {
                        Text(installations.musicscore.title)
                    })
            }
        }
        .navigationBarTitle("Installations")
    }
}

struct InstallationsPage_Previews: PreviewProvider {
    static var previews: some View {
        InstallationsPage()
    }
}

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
                NavigationLink {
                    InstallationPage(installation: Installation.liberace)
                } label: {
                    Text(Installation.liberace.title)
                }

                NavigationLink {
                    InstallationPage(installation: Installation.sleepparalysis)
                } label: {
                    Text(Installation.sleepparalysis.title)
                }

                NavigationLink {
                    InstallationPage(installation: Installation.saltpepperghosts)
                } label: {
                    Text(Installation.saltpepperghosts.title)
                }
            }

            Section(header: Text("The Surveillance Spa")) {
                NavigationLink {
                    InstallationPage(installation: Installation.interveningsubstance)
                } label: {
                    Text(Installation.interveningsubstance.title)
                }
                NavigationLink {
                    InstallationPage(installation: Installation.solidsjustfluids)
                } label: {
                    Text(Installation.solidsjustfluids.title)
                }
            }
            Section(header: Text("The Waiting Room")) {
                NavigationLink {
                    InstallationPage(installation: Installation.waitingroom)
                } label: {
                    Text(Installation.waitingroom.title)
                }
            }
            Section(header: Text("Data Assimilation Base")) {
                NavigationLink {
                    InstallationPage(installation: Installation.dreamsoldwholesale)
                } label: {
                    Text(Installation.dreamsoldwholesale.title)
                }
            }
            Section(header: Text("The Overwhelm")) {
                NavigationLink {
                    InstallationPage(installation: Installation.clownhouse)
                } label: {
                    Text(Installation.clownhouse.title)
                }

                NavigationLink {
                    InstallationPage(installation: Installation.photobooth)
                } label: {
                    Text(Installation.photobooth.title)
                }

            }
            Section(header: Text("NP2G Musical Score")) {
                NavigationLink {
                    InstallationPage(installation: Installation.musicscore)
                } label: {
                    Text(Installation.musicscore.title)
                }
            }
        }
        .navigationBarTitle("Installations")
    }
}

struct InstallationsPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InstallationsPage()
        }
    }
}

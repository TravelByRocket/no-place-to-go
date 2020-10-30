//
//  PartnersPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/28/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PartnersPage: View {
    var body: some View {
        List(partnerbio.allpartners) {partner in
            NavigationLink(destination: PartnerPage(partner: partner)) {
                PartnerRow(partner: partner)
            }
        }
        .navigationBarTitle("Partners & Funders")
    }
}

struct PartnersPage_Previews: PreviewProvider {
    static var previews: some View {
        PartnersPage()
    }
}

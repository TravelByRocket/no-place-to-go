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
        List(Partner.allpartners) {partner in
            NavigationLink {
                PartnerPage(partner: partner)
            } label: {
                PartnerRow(partner: partner)
            }
        }
        .navigationBarTitle("Partners & Funders")
    }
}

struct PartnersPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PartnersPage()
        }
    }
}

//
//  PartnerRow.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/28/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PartnerRow: View {
    let partner: Partners
    var body: some View {
        HStack {
            partner.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .padding(.trailing)
            Text(partner.name)
        }
    }
}

struct PartnerRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PartnersPage()
        }
    }
}

//
//  PartnerPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/28/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PartnerPage: View {
    let partner: partnerbio
    var body: some View {
        List {
            VStack(alignment: .center) {
                partner.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Text(partner.name)
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.Notable, size: 28))
                    .foregroundColor(Color("PinkHeadings"))
                Button(action: {
                    UIApplication.shared.open(URL(string:"http://\(self.partner.url)")!)
                }) {
                    Text(self.partner.url)
                        .font(.custom(fonts.ZCOOL, size: 18))
                        .foregroundColor(Color("Gold"))
                        .multilineTextAlignment(.center)
                }
                .padding(5)
            }
            Text(partner.bio)
                .font(.custom(fonts.ZCOOL, size: 20))
                .padding(.horizontal)
        }
    }
}

struct PartnerPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PartnerPage(partner: partnerbio.allpartners.randomElement()!)
        }
    }
}

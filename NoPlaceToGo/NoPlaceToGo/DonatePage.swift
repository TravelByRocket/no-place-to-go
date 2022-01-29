//
//  DonatePage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/10/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//
// swiftlint:disable line_length

import SwiftUI

struct DonatePage: View {
    var body: some View {
        VStack {
            Text("All proceeds go to increasing artist and performer pay. NP2G is collaboratively artist-centric and aims to support as many artists as possible by paying them for their time and visions. With your help we can offer NP2G artists and performers more support during these tough times.")
                .padding()
            Text("Kate Speer is a sponsored project of Fractured Atlas, a non-profit arts service organization. Contributions for the charitable purposes of Kate Speer must be made payable to Fractured Atlas only and are tax-deductible to the extent permitted by law.")
                .padding()
            HStack {
                Button {
                    UIApplication.shared.open(URL(string: "https://fundraising.fracturedatlas.org/kate-speer/general_support")!)
                } label: {
                    HStack {
                        Image("FracturedAtlas")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.vertical, .leading])
                            .padding(.trailing, 5)
                        Text("Donate at Fractured Atlas")
                            .font(.custom(fonts.Notable, size: 16))
                            .foregroundColor(Color("PinkHeadings"))
                            .multilineTextAlignment(.center)
                            .padding([.vertical, .trailing])
                            .padding(.leading, 5)
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1))
                .padding()
            }
        }
        .navigationBarTitle("Donate")
    }
}

struct DonatePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DonatePage()
        }
    }
}

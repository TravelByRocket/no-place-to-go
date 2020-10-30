//
//  NextSitePage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/9/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct NextSitePage: View {
    @EnvironmentObject private var pm: ProgressManager
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.pm.inTransitToSite = true
                self.pm.setLocation(to: self.pm.nextSite(from: pm.curSite!))
            }) {
                Text(pm.completions.hasCompletedAllSites
                        ? locations.finalDepartureConfirmationMessage
                        : locations.siteObjectFromSiteEnum(site: pm.curSite!).departureConfirmationMessage
                )
                .font(.custom(fonts.ZCOOL, size: 22))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Gold"))
                .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding(.horizontal, 40)
            .onAppear{
                switch pm.curSite! {
                case .LamarB:
                    pm.completions.lamarb = true
                case .LamarA:
                    pm.completions.lamara = true
                case .Tootsies:
                    pm.completions.tootsies = true
                case .MusicRange:
                    pm.completions.musicrange = true
                case .MintSerif:
                    pm.completions.mintserif = true
                case .MintSerifFinal:
                    pm.completions.mintseriffinal = true
                }
            }
            if (pm.completions.hasCompletedAllSites) {
                Text("If you are already at Mint & Serif (No Place), don't go anywhere. Please wait in your car as you listen to the next and final portion of the show.")
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.ZCOOL, size: 24))
                    .foregroundColor(Color("Gold"))
                    .padding(20)
            }
            Spacer()
        }
    }
}

struct NextSitePage_Previews: PreviewProvider {
    static var previews: some View {
        NextSitePage()
    }
}

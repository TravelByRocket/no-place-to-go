//
//  NextSitePage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/9/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ReadyForNextSiteView: View {
    @EnvironmentObject private var pm: ProgressManager // swiftlint:disable:this identifier_name

    var body: some View {
        VStack {
            Spacer()
            Button {
                self.pm.inTransitToSite = true
                self.pm.setLocation(to: self.pm.nextSite(from: pm.curSite ?? Sites.LamarA))
            } label: {
                Text(pm.completions.hasCompletedAllSites
                     ? Location.finalDepartureConfirmationMessage
                     : Location.siteObjectFromSiteEnum(site: pm.curSite ?? Sites.LamarA).departureConfirmationMessage)
                    .font(.custom(fonts.ZCOOL, size: 22))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Gold"))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding(.horizontal, 40)
            .onAppear {
                switch pm.curSite {
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
                default: // when previewing
                    print("Invalid case")
                }
            }
            if pm.completions.hasCompletedAllSites {
                Text("If you are already at Mint & Serif (No Place), don't go anywhere. Please wait in your car as you listen to the next and final portion of the show.") // swiftlint:disable:this line_length
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
        ReadyForNextSiteView()
            .environmentObject(ProgressManager())
    }
}

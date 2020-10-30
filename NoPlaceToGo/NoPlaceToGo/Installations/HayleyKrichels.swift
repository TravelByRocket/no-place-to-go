//
//  HayleyKrichels.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct HayleyKrichels: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    
    @State private var hasArrived = false
    
    @EnvironmentObject private var pm: ProgressManager
    var body: some View {
        VStack {
            if !hasArrived {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Please find the photo booth inside Mint & Serif across from the coffee bar.")
                            .multilineTextAlignment(.center)
                            .font(.custom(Fonts.ZCOOL.rawValue, size: 26))
                            .padding()
                            .onAppear{
                                pm.photoDate = Date()
                            }
                        Spacer()
                    }
                    Button(action: {
                        self.hasArrived = true
                    }) {
                        Text("I have arrived at\nthe photo booth")
                            .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                            .foregroundColor(Color(Colors.Gold.rawValue))
                            .padding()
                    }
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1))
                    .padding()
                    Spacer()
                }
            } else {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Image("hayleypin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 50)
                        Spacer()
                        Text("""
                            Please wait to be seen.

                            Have your Passcode ready.
                            """)
                            .multilineTextAlignment(.center)
                            .font(.custom(Fonts.ZCOOL.rawValue, size: 26))
                            .padding()
                        Spacer()
                        NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
                    }
                    Spacer()
                }
            }
        }
    }
}

//struct HayleyKrichels_Previews: PreviewProvider {
//    static var previews: some View {
//        HayleyKrichels()
//    }
//}

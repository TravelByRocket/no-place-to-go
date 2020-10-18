//
//  HayleyKrichels.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct HayleyKrichels: View {
    @EnvironmentObject var pm: ProgressManager
    var body: some View {
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
            Spacer()
        }
    }
}

struct HayleyKrichels_Previews: PreviewProvider {
    static var previews: some View {
        HayleyKrichels()
    }
}

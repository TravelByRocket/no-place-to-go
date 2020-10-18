//
//  StevenFrost.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct StevenFrost: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Please return to the app when Liberaci is finished with you.")
                    .multilineTextAlignment(.center)
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 26))
                    .padding()
                Spacer()
            }
            Spacer()
        }
    }
}

struct StevenFrost_Previews: PreviewProvider {
    static var previews: some View {
        StevenFrost()
    }
}

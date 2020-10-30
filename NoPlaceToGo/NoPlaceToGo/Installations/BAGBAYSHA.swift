//
//  BAGBAYSHA.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct BAGBAYSHA: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Please enjoy the installation. Come back to the app when you are done in this location.")
                    .multilineTextAlignment(.center)
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 26))
                    .padding()
                Spacer()
            }
            Spacer()
        }
    }
}

struct BAGBAYSHA_Previews: PreviewProvider {
    static var previews: some View {
        BAGBAYSHA()
    }
}

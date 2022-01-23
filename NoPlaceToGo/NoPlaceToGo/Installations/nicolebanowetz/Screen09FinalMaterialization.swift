//
//  Screen09FinalMaterialization.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct Screen09FinalMaterialization: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int

    var body: some View {
        VStack {
            Text("""
                All phases of materialization are complete.

                Thank you for adding to the machine mediums' data collection.

                Please follow the arrows to the next installation
                """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
                .padding(20)
            Image("ghost")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            Spacer()
            NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite, messageNext: "I have arrived at\nthe next installation")
        }
    }
}

struct Screen09FinalMaterialization_Previews: PreviewProvider {
    static var previews: some View {
        Screen09FinalMaterialization(installIndex: .constant(1), numInstallsAtSite: 1)
    }
}

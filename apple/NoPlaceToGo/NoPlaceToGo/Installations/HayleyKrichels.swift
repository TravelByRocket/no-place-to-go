//
//  HayleyKrichels.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct HayleyKrichels: View {
    var body: some View {
        VStack {
            Text("Send notification later, maybe after next site complete, shows photo taken at site")
            RemoteImage(url: "https://files.synodic.co/np2g/oct16/group1830.jpg")
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct HayleyKrichels_Previews: PreviewProvider {
    static var previews: some View {
        HayleyKrichels()
    }
}

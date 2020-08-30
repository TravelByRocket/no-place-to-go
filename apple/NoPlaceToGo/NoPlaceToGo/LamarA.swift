//
//  LamarA.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

struct LamarA: View {
    let site = AddressedSite.lamarA
    var body: some View {
        Button(action: {
            self.site.getDirections()
        }) {
        Text("Get directions")
        }
    }
}

struct LamarA_Previews: PreviewProvider {
    static var previews: some View {
        LamarA()
    }
}

//
//  AboutPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct AboutPage: View {
    var body: some View {
        Text("No Place to Go was organized and produced by Kate Speer, Serena Chopra, and Franie Toan.\nThe Np2G app was developed by Bryan Costanza")
        .navigationBarTitle("About NP2G")
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage()
    }
}

//
//  InstallationRow.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/8/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct InstallationRow: View {
    let installation: Installation
    var body: some View {
        Text(installation.title)
    }
}

struct InstallationRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InstallationsPage()
        }
    }
}

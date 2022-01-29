//
//  HelpPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/9/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct HelpPage: View {
    var body: some View {
        List {
            Section(header: Text("App Usage")) {
                Text("If you made a mistake with the group password or app permissions, delete the app and reinstall it.") // swiftlint:disable:this line_length
                Button {
                    UIApplication.shared.open(URL(string: "mailto:support@synodic.co")!)
                } label: {
                    Text("For app issues, write to support@synodic.co")
                }
            }
            Section(header: Text("Urgent Issues")) {
                Button {
                    UIApplication.shared.open(URL(string: "tel:1-720-675-7901")!)
                } label: {
                    Text("Call (720) 675-7901")
                }
            }
        }
        .navigationBarTitle("Help")
    }
}

struct HelpPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HelpPage()
        }
    }
}

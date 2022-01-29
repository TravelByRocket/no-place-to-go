//
//  EnterGroupPassword.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/25/20.
//

import SwiftUI

struct StartPage: View {
    @State private var textEntry = ""

    @EnvironmentObject var pm: ProgressManager // swiftlint:disable:this identifier_name

    var matching: Bool {
        CarGroup.codePhrases[textEntry.lowercased()] != nil
    }

    var body: some View {
        VStack {
            Image("nptg_transparent")
                .resizable()
                .aspectRatio(contentMode: .fit)
            TextField("Try to go somewhere", text: $textEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
            Button {
                // can force unwrap because protected by `matching`
                let carGroup = CarGroup.codePhrases[self.textEntry.lowercased()]!
                let siteEnum = carGroup.startingLocation
                pm.setLocation(to: siteEnum)
                pm.carGroup = carGroup
                pm.date = Date()
                if textEntry.lowercased() == "allcomplete" {
                    pm.setLocation(to: .MintSerifFinal)
                    pm.inTransitToSite = false
                } else if textEntry.lowercased() == "tofinal" {
                    pm.setLocation(to: .MintSerifFinal)
                    pm.inTransitToSite = true
                }
            } label: {
                HStack {
                    Spacer()
                    Text(matching ? "Try this out..." : "You're not going anywhere")
                        .foregroundColor(matching ? Color("Gold") : .secondary)
                        .padding()
                    Spacer()
                }
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(matching ? Color.primary : Color.secondary, lineWidth: 1))
                .padding()
            }
            .disabled(!matching)
        }
    }
}

struct EnterGroupPassword_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}

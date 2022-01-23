//
//  EnterGroupPassword.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/25/20.
//

import SwiftUI

struct StartPage: View {
    @State private var passwordEntry = ""
    @EnvironmentObject var pm: ProgressManager
    
    let passDict: [String: CarGroup] =
    ["tootsies": .a3,
     "mintserif": CarGroup(.MintSerif, "a", 1), // cannot normally start here
     "lamara": .a2,
     "lamarb": .a1,
     "musicrange": .a4,
     "allcomplete": .c4,
     "tofinal": .a1,
     // shortcuts above, guest access below
     "paparazzi": .a1,
     "quarandream": .a2,
     "hologrammasks": .a3,
     "liberace": .a4,
     "surveillancespa": .b1,
     "ectoplasm": .b2,
     "systemfailure": .b3,
     "cyborg": .b4,
     "jauntyvampire": .c1,
     "clowntherapy": .c2,
     "revolution": .c3,
     "dreamdatabase": .c4,
     "queerdreams": .d1,
     "belief=fact": .d2,
     "nightmaredesires": .d3,
     "secrets": .d4,
     "toxicsanitation": .e1,
     "noplace2go": .e2,
     "beanyone!": .e3,
     "goanywhere!": .e4,
     "staythecourse!": .f1,
     "soulblueprint": .f2,
     "dataghost": .f3,
     "fearfulphotos": .f4]
    
    var matching: Bool {
        passDict[passwordEntry.lowercased()] != nil
    }
    
    var body: some View {
        VStack {
            Image("nptg_transparent")
                .resizable()
                .aspectRatio(contentMode: .fit)
            TextField("Try to go somewhere", text: $passwordEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
            if matching {
                Button {
                    let carGroup = self.passDict[self.passwordEntry.lowercased()]!
                    let siteEnum = carGroup.startingLocation // force unwrap OK because being check by `matching`
                    self.pm.setLocation(to: siteEnum)
                    self.pm.carGroup = carGroup
                    self.pm.date = Date()
                    if (passwordEntry.lowercased() == "allcomplete") {
                        self.pm.setLocation(to: .MintSerifFinal)
                        self.pm.inTransitToSite = false
                    } else if (passwordEntry.lowercased() == "tofinal") {
                        self.pm.setLocation(to: .MintSerifFinal)
                        self.pm.inTransitToSite = true
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("Try this out...")
                            .padding()
                            .foregroundColor(Color("Gold"))
                        Spacer()
                    }
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1))
                    .padding()
                }
            } else {
                HStack {
                    Spacer()
                    Text("You're not going anywhere")
                        .padding()
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.primary, lineWidth: 1)
                )
                .padding()
            }
        }
    }
}

struct EnterGroupPassword_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}

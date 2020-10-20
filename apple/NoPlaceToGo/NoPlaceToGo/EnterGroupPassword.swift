//
//  EnterGroupPassword.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/25/20.
//

import SwiftUI

struct EnterGroupPassword: View {
    @State private var passwordEntry = ""
    @EnvironmentObject var pm: ProgressManager
    
    let passDict: [String: CarGroup] = ["tootsies": .a3,
                                        "mintserif": CarGroup(.MintSerif, "a", 1),
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
                                     "staythecourse!": .d1,
                                     "soulblueprint": .d2,
                                     "dataghost": .d3,
                                     "fearfulphotos": .d4
    ]
    
    var matching: Bool {
        passDict[passwordEntry.lowercased()] != nil
    }
    
    var body: some View {
        VStack {
            Image("nptg_transparent")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .edgesIgnoringSafeArea(.top)
            TextField("Try to go somewhere", text: $passwordEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
//                .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                .padding()
            if matching {
                Button(action: {
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
                    
                }) {
                    HStack {
                        Spacer()
                        Text("Try this out...")
                        .padding()
                        .foregroundColor(Color("Gold"))
//                        .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
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
//                        .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
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
        EnterGroupPassword()
    }
}

struct CarGroup {
    let startingLocation: Sites
    let groupLetter: Character
    let groupNumber: Int
    
    init(_ startingLocation: Sites, _ groupLetter: Character, _ groupNumber: Int) {
        self.startingLocation = startingLocation
        self.groupLetter = groupLetter
        self.groupNumber = groupNumber
    }
    
    var asString: String {
        return String(groupLetter) + String(groupNumber)
    }
    
    static let a1 = CarGroup(.LamarB,"a",1)
    static let a2 = CarGroup(.LamarA,"a",2)
    static let a3 = CarGroup(.Tootsies,"a",3)
    static let a4 = CarGroup(.MusicRange,"a",4)
    static let b1 = CarGroup(.LamarB,"b",1)
    static let b2 = CarGroup(.LamarA,"b",2)
    static let b3 = CarGroup(.Tootsies,"b",3)
    static let b4 = CarGroup(.MusicRange,"b",4)
    static let c1 = CarGroup(.LamarB,"c",1)
    static let c2 = CarGroup(.LamarA,"c",2)
    static let c3 = CarGroup(.Tootsies,"c",3)
    static let c4 = CarGroup(.MusicRange,"c",4)
    static let d1 = CarGroup(.LamarB,"d",1)
    static let d2 = CarGroup(.LamarA,"d",2)
    static let d3 = CarGroup(.Tootsies,"d",3)
    static let d4 = CarGroup(.MusicRange,"d",4)
    static let e1 = CarGroup(.LamarB,"d",1)
    static let e2 = CarGroup(.LamarA,"d",2)
    static let e3 = CarGroup(.Tootsies,"d",3)
    static let e4 = CarGroup(.MusicRange,"d",4)
    static let f1 = CarGroup(.LamarB,"d",1)
    static let f2 = CarGroup(.LamarA,"d",2)
    static let f3 = CarGroup(.Tootsies,"d",3)
    static let f4 = CarGroup(.MusicRange,"d",4)
}

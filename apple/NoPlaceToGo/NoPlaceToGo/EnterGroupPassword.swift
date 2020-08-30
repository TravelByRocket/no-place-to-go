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
    
    let passDict: [String: Sites] = ["tootsies": Sites.Tootsies,
                                     "mintserif": Sites.MintSerif,
                                     "lamara": Sites.LamarA,
                                     "lamarb": Sites.LamarB,
                                     "musicrange": Sites.MusicRange]
    
    var matching: Bool {
        passDict[passwordEntry.lowercased()] != nil
    }
    
    var body: some View {
        Form {
            TextField("Enter Password", text: $passwordEntry)
            if matching {
                Button("Start the Journey") {
                    let siteEnum = self.passDict[self.passwordEntry.lowercased()]! // force unwrap OK because being check by `matching`
                    self.pm.setLocation(to: siteEnum)
//                    let siteObject = AddressedSite.siteObjectFromSiteEnum(site: siteEnum)
//                    self.pm.getDirections(to: siteObject.addressSearchableString)
                }
            } else {
                Text("Password does not match")
            }
            Text("The passwords are the name of the location lowercase with no spaces:\n-mintserif\n-lamara\n-lamarb\n-musicrange\n-tootsies")
                .padding()
        }
    }
}

struct EnterGroupPassword_Previews: PreviewProvider {
    static var previews: some View {
        EnterGroupPassword()
    }
}

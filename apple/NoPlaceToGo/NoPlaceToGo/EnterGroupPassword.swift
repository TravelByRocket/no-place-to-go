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
        VStack {
            Image("nptg_transparent")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
            TextField("Try to go somewhere", text: $passwordEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            if matching {
                Button(action: {
                    let siteEnum = self.passDict[self.passwordEntry.lowercased()]! // force unwrap OK because being check by `matching`
                    self.pm.setLocation(to: siteEnum)
                    
                }) {
                    HStack {
                        Spacer()
                        Text("Try this out...")
                        .padding()
                        .foregroundColor(Color("Gold"))
//                        .font(.custom(Fonts.ZCOOL.rawValue, size: 20))
                        Spacer()
                    }
                    .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primary, lineWidth: 1))
                    .padding()
                }
            } else {
                HStack {
                    Spacer()
                    Text("You're not going anywhere")
                        .padding()
//                        .font(.custom(Fonts.ZCOOL.rawValue, size: 20))
                    Spacer()
                }
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primary, lineWidth: 1)
                )
                .padding()
            }
//            Text("The passwords are the name of the location lowercase with no spaces:\n-mintserif\n-lamara\n-lamarb\n-musicrange\n-tootsies")
//                .foregroundColor(.secondary)
//                .italic()
//                .padding()
        }
    }
}

struct EnterGroupPassword_Previews: PreviewProvider {
    static var previews: some View {
        EnterGroupPassword()
    }
}

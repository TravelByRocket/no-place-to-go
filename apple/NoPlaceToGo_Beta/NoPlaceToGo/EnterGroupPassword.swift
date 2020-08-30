//
//  EnterGroupPassword.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/25/20.
//

import SwiftUI

struct EnterGroupPassword: View {
    @State private var password = ""
    
    let codes = ["ghost","house"]
    
    let passDict: [String: AddressedSite] = ["pass1": AddressedSite.lamarA,
                                             "pass2": AddressedSite.mintSerif]
    
    var matchDesc: String {
        let index = codes.firstIndex(of: password.lowercased())
        if let index = index {
            return "Matched Password \(index)"
        } else {
            return "No Match"
        }
    }
    
    var matching: Bool {
        codes.contains(password.lowercased())
    }
    
    var body: some View {
        Form {
            TextField("Enter Password", text: $password)
            Text(matchDesc)
            if matching {
                Button("Start the Jounrey") {
                    UIApplication.shared.open(URL(string: "https://maps.google.com/?daddr=@40.0198221,-105.2794147&directionsmode=walking")!)
                }
            }
        }
    }
}

struct EnterGroupPassword_Previews: PreviewProvider {
    static var previews: some View {
        EnterGroupPassword()
    }
}

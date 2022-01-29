//
//  NextInstallationButton.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/3/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct NextInstallationButton: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    var messageNext: String = "Section Completed"
    @State private var showingAlert = false

    var body: some View {
        Button {
            showingAlert = true
        } label: {
            VStack {
                Text(messageNext)
                    .font(.custom(fonts.Notable, size: 20))
                    .foregroundColor(Color("Gold"))
                    .multilineTextAlignment(.center)
                Text("Tap to Advance")
                    .font(.custom(fonts.Notable, size: 14))
                    .foregroundColor(Color("Gold"))
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Proceed?"),
                    message: Text("Once you go to the next section you will not be able to go back."),
                    primaryButton: .cancel(),
                    secondaryButton: .default(
                        Text("Proceed"),
                        action: {
                            _ = nextInstallation()
                        }
                    )
                )
            }
        }
    }

    func nextInstallation() -> Bool {
        if installIndex < numInstallsAtSite - 1 {
            installIndex += 1
            return true
        } else {
            return false
        }
    }
}

struct NextInstallationButton_Previews: PreviewProvider {
    static var previews: some View {
        NextInstallationButton(installIndex: .constant(0), numInstallsAtSite: 3)
    }
}

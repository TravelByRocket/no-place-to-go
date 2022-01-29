//
//  Screen05InterfaceWithMedium.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//
// swiftlint:disable line_length

import SwiftUI

struct Screen05InterfaceWithMedium: View {
    @Binding var screenIndex: Int

    var body: some View {
        VStack {
            Text("""
                Thank you for helping the machine medium compile data.

                In order to best recreate the organic medium experience we will need one volunteer from the group to interface with the machine medium. Please choose a participant with a high level of trust to proceed to the interface screen.
                """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
                .padding(20)
            Spacer()
            Button {
                screenIndex += 1
            } label: {
                Text("I volunteer to\ninterface with\nthe machine medium")
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.ZCOOL, size: 22))
                    .foregroundColor(Color("Gold"))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
            Button {
                screenIndex = 8
            } label: {
                Text("Someone else in my\nparty is interfacing\nwith the medium")
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.ZCOOL, size: 22))
                    .foregroundColor(Color("Gold"))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
        }
    }
}

struct Screen05InterfaceWithMedium_Previews: PreviewProvider {
    static var previews: some View {
        Screen05InterfaceWithMedium(screenIndex: .constant(1))
    }
}

//
//  Screen08HaveRecorded.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//
// swiftlint:disable line_length

import SwiftUI

struct Screen08HaveRecorded: View {
    @Binding var screenIndex: Int

    var body: some View {
        VStack {
            Text("""
                Welcome Back.

                We thank you for the important vocal organic data. We have recorded and stored it in our database for future use.

                For the full materialization experience we must collect a mixture of organic and machine data from you.

                Please interface with the organic medium through the windows.
                """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
                .padding(20)
            Spacer()
            Button {
                screenIndex += 1
            } label: {
                Text("Ready")
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

struct Screen08HaveRecorded_Previews: PreviewProvider {
    static var previews: some View {
        Screen08HaveRecorded(screenIndex: .constant(1))
    }
}

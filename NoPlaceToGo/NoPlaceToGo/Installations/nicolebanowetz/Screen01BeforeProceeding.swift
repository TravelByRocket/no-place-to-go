//
//  Screen01BeforeProceeding.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct Screen01BeforeProceeding: View {
    @Binding var screenIndex: Int
    
    var body: some View {
        VStack {
            Spacer()
            Text("""
                Stop.

                Before approaching the medium you must answer a series of questions.

                We will guide you. The organic medium is fragile. If she is unavailable we hope you will trust us. We are a network of machine mediums she has trained to replace her once her kind are extinct.
                """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
                .padding(20)
            Spacer()
            Button {
                screenIndex += 1
            } label: {
                Text("Ready to Answer")
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

struct Screen01BeforeProceeding_Previews: PreviewProvider {
    static var previews: some View {
        Screen01BeforeProceeding(screenIndex: .constant(1))
    }
}

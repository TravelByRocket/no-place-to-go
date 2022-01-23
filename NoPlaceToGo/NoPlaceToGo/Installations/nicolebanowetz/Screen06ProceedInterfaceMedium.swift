//
//  Screen06ProceedInterfaceMedium.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct Screen06ProceedInterfaceMedium: View {
    @Binding var screenIndex: Int

    var body: some View {
        VStack {
            Text("""
                Please proceed to the machine medium's interface to connect to the psychic network and receive your materialization.

                For your own safety proceed only if no other humans are in the vicinity.
                """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
                .padding(20)
            Spacer()
            Image("amp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            Spacer()
            Button {
                screenIndex += 1
            } label: {
                Text("I have arrived\nat the interface.")
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

struct Screen06ProceedInterfaceMedium_Previews: PreviewProvider {
    static var previews: some View {
        Screen06ProceedInterfaceMedium(screenIndex: .constant(1))
    }
}

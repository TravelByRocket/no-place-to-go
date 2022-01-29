//
//  Screen07MeetMachine.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//
// swiftlint:disable line_length

import SwiftUI

struct Screen07MeetMachine: View {
    @Binding var screenIndex: Int
    @State private var counter = 0

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("""
                When you are ready to meet the machine medium please introduce yourself by speaking into the machine eye above the interface screen.

                The machine medium will guide you.

                Thank you.
                """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
                .padding(20)
                .onReceive(timer, perform: { _ in
                    if counter < 30 {
                        counter += 1
                    } else {
                        screenIndex += 1
                    }
                })
            Image("light")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            Spacer()
            Button {
                screenIndex += 1
            } label: {
                Text("I am done interfacing\nwith the medium")
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.ZCOOL, size: 22))
                    .foregroundColor(Color("Gold"))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1))
                    .padding()
            }
        }
    }
}

struct Screen07MeetMachine_Previews: PreviewProvider {
    static var previews: some View {
        Screen07MeetMachine(screenIndex: .constant(1))
    }
}

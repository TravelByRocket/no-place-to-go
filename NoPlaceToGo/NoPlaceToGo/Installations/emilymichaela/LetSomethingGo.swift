//
//  PhaseOne.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/19/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct LetSomethingGo: View {
    @Binding var canProceed: Bool
    var secondsToWait: Int = 5

    @State private var whatToLeave: String = ""
    @State private var hasLetSomethingGo = false
    @State private var secondsCounter: Int = 0
    @State private var rectWidth: CGFloat = 0

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private var randomResponse: String {
        let messages = [
            "How heartless of you",
            "Great choice!",
            "Are you sure? ... very well"]
        return messages.randomElement()!
    }

    var body: some View {
        VStack {
            if !hasLetSomethingGo {
                Text("You're entering a new world and you must leave something of great value behind. What do you choose?") // swiftlint:disable:this line_length
                    .font(.custom(fonts.ZCOOL, size: 26))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.vertical)
                TextField("I'm letting go of...", text: $whatToLeave)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                    .padding(.vertical)
                    .font(.headline)
                LetGoButton(whatToLeave: $whatToLeave, hasLetSomethingGo: $hasLetSomethingGo)
                    .padding(.vertical)
                Spacer()
            } else {
                VStack {
                    Spacer()
                    Text(randomResponse)
                        .font(.custom(fonts.ZCOOL, size: 30))
                        .onReceive(timer, perform: { _ in
                            if self.secondsCounter < self.secondsToWait {
                                self.secondsCounter += 1
                            } else {
                                self.canProceed = true
                            }
                        })
                    Spacer()
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: rectWidth, height: 20, alignment: .center)
                            .foregroundColor(Color("PinkHeadings"))
                            .onAppear {
                                rectWidth = geo.size.width
                            }
                            .onReceive(timer, perform: { _ in
                                withAnimation(.linear(duration: 1)) {
                                    rectWidth = geo.size.width * CGFloat((secondsToWait - secondsCounter)) / 5.0
                                }
                            })
                    }
                }
            }
        }
    }
}

struct PhaseOne_Previews: PreviewProvider {
    static var previews: some View {
        LetSomethingGo(canProceed: .constant(false))
    }
}

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
    
    // Properties below should be private but caused initializer access issue
    
    var randomResponse: String = ["How heartless of you",
                                          "Great choice!",
                                          "Are you sure? ... very well"].randomElement()!
    
    @State var whatToLeave: String = ""
    @State var hasLetSomethingGo = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var secondsToWait: Int = 5
    @State var secondsCounter: Int = 0
    @State var rectWidth: CGFloat = 0
    
    var body: some View {
        if !hasLetSomethingGo {
            Text("You're entering a new world and you must leave something of great value behind. What do you choose?")
                .font(.custom(Fonts.ZCOOL.rawValue, size: 26))
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
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 30))
                    .onReceive(timer, perform: { _ in
                        if self.secondsCounter < self.secondsToWait {
                            self.secondsCounter += 1
                        } else {
                            self.canProceed = true
                        }
                    })
                Spacer()
                GeometryReader{geo in
                    Rectangle()
                        .frame(width: rectWidth, height: 20, alignment: .center)
                        .foregroundColor(Color(Colors.PinkHeadings.rawValue))
                        .onAppear{
                            rectWidth = geo.size.width
                        }
                        .onReceive(timer, perform: { _ in
                            withAnimation(.linear(duration: 1)){
                                rectWidth = geo.size.width * CGFloat((secondsToWait - secondsCounter)) / 5.0
                            }
                        })
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

struct LetGoButton: View {
    @Binding var whatToLeave: String
    @Binding var hasLetSomethingGo: Bool
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Let it Go")
                .font(.custom(Fonts.Notable.rawValue, size: 30))
                .padding(20)
                .background(Color(Colors.PinkHeadings.rawValue))
                .mask(RoundedRectangle(cornerRadius: 25))
                .foregroundColor(whatToLeave.count < 3 ? .secondary : .black)
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Important message"),
                message: Text("Are you sure you want to let go of \(whatToLeave)?"),
                primaryButton: .destructive(Text("Yes, forever")) {
                    self.hasLetSomethingGo = true
                },
                secondaryButton: .cancel(Text("Maybe not")) {
                }
            )
        }
        .opacity(whatToLeave.count < 3 ? 0.3 : 1.0)
        .disabled(whatToLeave.count < 3)
    }
}

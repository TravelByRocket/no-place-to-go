//
//  Screen03HumanOrMachine.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct Screen03HumanOrMachine: View {
    @Binding var screenIndex: Int
    @State private var hasAnswer = false

    var body: some View {
        VStack {
            Text("Do you feel more comfortable confiding in a human face to face or through a machine interface such as your hand held device?")
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
            .padding(20)
            Form {
                PickAnswers(question: "I prefer...", hasSelection: $hasAnswer, leftSide : "Face to Face", rightSide: "Handheld Device")
            }
            Spacer()
            Image("hands")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            Spacer()
            Button {
                screenIndex += 1
            } label: {
                Text("Submit Responses")
                    .font(.custom(fonts.ZCOOL, size: 22))
                    .foregroundColor(Color("Gold"))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .disabled(!hasAnswer)
            .opacity(!hasAnswer ? 0.2 : 1.0)
            .padding()
        }
    }
}

struct Screen03HumanOrMachine_Previews: PreviewProvider {
    static var previews: some View {
        Screen03HumanOrMachine(screenIndex: .constant(1))
    }
}

//
//  PickAnswers.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PickAnswers: View {
    let question: String
    @Binding var hasSelection: Bool
    var leftSide = "Yes"
    var rightSide = "No"

    @State private var isSelectedYes = false
    @State private var isSelectedNo = false

    var body: some View {
        VStack {
            Text(question)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 20))
                .padding(.bottom, 5)
            HStack {
                Spacer()
                HStack {
                    Text(leftSide)
                        .fixedSize(horizontal: false, vertical: true)
                    Image(systemName: isSelectedYes ? "checkmark.square.fill" : "square")
                }
                .onTapGesture {
                    isSelectedYes = true
                    isSelectedNo = false
                    hasSelection = true
                }
                Spacer()
                HStack {
                    Image(systemName: isSelectedNo ? "checkmark.square.fill" : "square")
                    Text(rightSide)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .onTapGesture {
                    isSelectedYes = false
                    isSelectedNo = true
                    hasSelection = true
                }
                Spacer()
            }
            .font(.headline)
        }
    }
}

struct PickAnswers_Previews: PreviewProvider {
    static var previews: some View {
        PickAnswers(question: "What is what?", hasSelection: .constant(false))
    }
}

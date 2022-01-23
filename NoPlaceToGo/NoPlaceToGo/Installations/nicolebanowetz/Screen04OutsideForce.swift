//
//  Screen04OutsideForce.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct Screen04OutsideForce: View {
    @Binding var screenIndex: Int
    @State private var hasAnswer1 = false
    @State private var hasAnswer2 = false

    var body: some View {
        VStack {
            Text("Do you believe an outside force may know you better than you know yourself?")
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
            .padding(20)
            Form {
                PickAnswers(question: "Spiritual Organic Medium", hasSelection: $hasAnswer1)
                PickAnswers(question: "Artificial Intelligence", hasSelection: $hasAnswer2)
            }
            Spacer()
            Image("gloves")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 100)
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
            .disabled(!hasAnswer1 || !hasAnswer2)
            .opacity(!hasAnswer1 || !hasAnswer2 ? 0.2 : 1.0)
            .padding()
        }
    }
}

struct Screen04OutsideForce_Previews: PreviewProvider {
    static var previews: some View {
        Screen04OutsideForce(screenIndex: .constant(1))
    }
}

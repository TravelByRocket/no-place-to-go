//
//  LetGoButton.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct LetGoButton: View {
    @Binding var whatToLeave: String
    @Binding var hasLetSomethingGo: Bool
    @State private var showingAlert = false

    var body: some View {
        Button {
            self.showingAlert = true
        } label: {
            Text("Let it Go")
                .font(.custom(fonts.Notable, size: 30))
                .padding(20)
                .background(Color("PinkHeadings"))
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

struct LetGoButton_Previews: PreviewProvider {
    @State private static var text = ""
    @State private static var hasLetGo = false

    static var previews: some View {
        LetGoButton(whatToLeave: $text, hasLetSomethingGo: $hasLetGo)
            .previewLayout(.sizeThatFits)
    }
}

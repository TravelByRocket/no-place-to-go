//
//  NolanTredway.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct NolanTredway: View {
    @State private var angle = 0.0

    var body: some View {
        VStack {
            Spacer()
            Text("Welcome. Please find the genitals that match your body, and press the corresponding button on the center console.") // swiftlint:disable:this line_length
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .padding()
            Spacer()
            Image("nolaninstallationicon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .rotationEffect(.degrees(angle))
                .onAppear {
                    withAnimation(.linear(duration: 18.0).repeatForever(autoreverses: false)) {
                        angle += 360
                    }
                }
            Spacer()
        }
    }
}

struct NolanTredway_Previews: PreviewProvider {
    static var previews: some View {
        NolanTredway()
    }
}

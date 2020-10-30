//
//  NolanTredway.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct NolanTredway: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var angle = 0.0
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome. Please find the genitals that match your body, and press the corresponding button on the center console.")
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .padding()
            Spacer()
            Image("nolaninstallationicon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .rotationEffect(.degrees(angle))
                .onAppear{
                    withAnimation(.linear(duration: 1.0)) {
                        angle += 20
                    }
                }
                .onReceive(timer) { _ in
                    withAnimation(.linear(duration: 1.0)) {
                        angle += 20
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

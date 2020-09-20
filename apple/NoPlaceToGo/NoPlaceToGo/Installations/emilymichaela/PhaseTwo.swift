//
//  PhaseTwo.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/19/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PhaseTwo: View {
    @State private var scannerOffset: CGFloat = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader {geo in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(Colors.AccentColor.rawValue))
                    .frame(height: 8)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: 0, y: scannerOffset)
                    .onReceive(timer) {_ in
                        self.scannerOffset = remainder(
                            self.scannerOffset + geo.size.height / 10,
                            geo.size.height * 1.4)
                    }
                    .animation(.easeIn)
                VStack {
                    Spacer()
                    Circle()
                        .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                    Text("Scan your eye to verify your identity and proceed")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                    Spacer()
                    Spacer()
                }
            }
        }
//        Text("possibly send BLE signal to change audio at end of first phase")
//        Text("Language at completion: data received.")
    }
}


struct PhaseTwo_Previews: PreviewProvider {
    static var previews: some View {
        PhaseTwo()
    }
}

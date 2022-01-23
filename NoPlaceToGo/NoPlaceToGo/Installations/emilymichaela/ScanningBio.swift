//
//  PhaseTwo.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/19/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ScanningBio: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    @State private var scannerOffset: CGFloat = -50
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = -1
    @State private var dataRecorded = false
    @State private var rectWidth: CGFloat = 5
        
    var body: some View {
        
        if !dataRecorded {
            GeometryReader {geo in
                ZStack {
                    VStack {
                        Rectangle()
                            .foregroundColor(Color("AccentColor"))
                            .frame(height: 8)
                            .edgesIgnoringSafeArea(.all)
                            .offset(x: 0, y: scannerOffset - geo.size.height / 5)
                            .onReceive(timer) {_ in
                                if (counter % 5 == 0) {
                                    withAnimation(.linear(duration: 1)) {
                                        self.scannerOffset = -geo.size.height * 0.1
                                    }
                                } else if (counter % 5 == 1) {
                                    withAnimation(.linear(duration: 4)) {
                                        self.scannerOffset = geo.size.height * 1.4
                                    }
                                }
                                counter += 1
                                if (counter >= 20) {
                                    dataRecorded = true
                                }
                            }
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        Circle()
                            .frame(
                                width: geo.size.width / 3,
                                height: geo.size.width / 3)
                        Spacer()
                        Text("Scanning your eye to verify your identity and proceed")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50)
                            .padding()
                        Rectangle()
                            .frame(width: rectWidth, height: 20, alignment: .center)
                            .foregroundColor(Color("PinkHeadings"))
                            .onAppear{
                                rectWidth = geo.size.width
                            }
                            .onReceive(timer, perform: { _ in
                                withAnimation(.linear(duration: 1)) {
                                    rectWidth = geo.size.width * CGFloat(19 - counter) / CGFloat(20)
                                }
                            })
                        Spacer()
                    }
                }
            }
        } else {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Thank you.\nData received.\nYou may proceed.")
                        .font(.custom(fonts.Notable, size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("AccentColor"))
                    Spacer()
                }
                Spacer()
                NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            }
        }
    }
}

struct ScanningBio_Previews: PreviewProvider {
    static var previews: some View {
        ScanningBio(installIndex: .constant(1), numInstallsAtSite: 1)
    }
}

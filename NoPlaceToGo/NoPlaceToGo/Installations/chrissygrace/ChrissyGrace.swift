//
//  ChrissyGrace.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ChrissyGrace: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var counter = 0

    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        return formatter
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    if counter < 10 {
                        Text("Please follow the arrows on the floor to the back of Liberace's dream\n\n\(10-counter)")
                            .multilineTextAlignment(.center)
                            .font(.custom(fonts.ZCOOL, size: 26))
                            .padding()
                            .foregroundColor(.primary)
                    } else if counter < 16 {
                        Image("Demon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        PlayerView()
                        NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
                    }
                }
                Spacer()
            }
            .onReceive(timer) { _ in
                counter += 1
            }
            Spacer()
        }
        .foregroundColor(.pink)
    }
}

struct ChrissyGrace_Previews: PreviewProvider {
    static var previews: some View {
        ChrissyGrace(installIndex: .constant(1), numInstallsAtSite: 1)
    }
}

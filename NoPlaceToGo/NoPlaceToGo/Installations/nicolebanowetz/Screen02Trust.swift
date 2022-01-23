//
//  Screen02Trust.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct Screen02Trust: View {
    @Binding var screenIndex: Int
    @State private var trustLevel1 = 3.0
    @State private var trustLevel2 = 3.0
    @State private var trustLevel3 = 3.0
    @State private var trustLevel4 = 3.0
    @State private var trustLevel5 = 3.0

    var body: some View {
        VStack {
            Text("""
                    Please indicate your level of trust, 1 meaning no trust and 5 meaning complete trust.

                    If you were given advice from _____, would you trust that advice?
                    """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .foregroundColor(Color("Gold"))
                .padding(20)
            Form {
                VStack {
                    Text("Close deceased relative (Spirit)")
                    HStack {
                        Text("Less\nTrust")
                        Slider(value: $trustLevel1, in: 1.0 ... 5.0, step: 1.0)
                        Text("More\nTrust")
                    }

                }
                .fixedSize(horizontal: false, vertical: true)
                VStack {
                    Text("Spiritual Organic Medium")
                    HStack {
                        Text("Less\nTrust")
                        Slider(value: $trustLevel2, in: 1.0 ... 5.0, step: 1.0)
                        Text("More\nTrust")
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                VStack {
                    Text("Artificial Intelligence")
                    HStack {
                        Text("Less\nTrust")
                        Slider(value: $trustLevel3, in: 1.0 ... 5.0, step: 1.0)
                        Text("More\nTrust")
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                VStack {
                    Text("Machine Medium")
                    HStack {
                        Text("Less\nTrust")
                        Slider(value: $trustLevel4, in: 1.0 ... 5.0, step: 1.0)
                        Text("More\nTrust")
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            .multilineTextAlignment(.center)
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
            .padding()
        }
    }
}

struct Screen02Trust_Previews: PreviewProvider {
    static var previews: some View {
        Screen02Trust(screenIndex: .constant(1))
    }
}

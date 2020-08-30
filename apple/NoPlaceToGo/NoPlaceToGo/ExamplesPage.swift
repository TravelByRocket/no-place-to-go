//
//  ExamplesPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ExamplesPage: View {
    let defaults = UserDefaults.standard
    @State private var preferGoogle: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Color(Colors.Gold.rawValue)
                Text(Fonts.Notable.rawValue)
                    .font(.custom(Fonts.Notable.rawValue, size: 26))
                    .foregroundColor(Color(Colors.PinkHeadings.rawValue))
            }
            ZStack {
                Color(Colors.PinkHeadings.rawValue)
                Text(Fonts.ZCOOL.rawValue)
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 26))
                    .foregroundColor(Color(Colors.Gold.rawValue))
            }
            EnterGroupPassword()
            Text("Go to Apple Maps")
                .onTapGesture {
                    UIApplication.shared.open(URL(string: "http://maps.apple.com/?daddr=40.0198221,-105.2794147&dirflag=w")!) // `dirflag=d` for car but it dosn't seem to make a difference
                }
                .padding()
            Text("Go to Google Maps")
                .onTapGesture {
                    UIApplication.shared.open(URL(string: "https://maps.google.com/?daddr=@40.0198221,-105.2794147&directionsmode=walking")!) // `directionsmode=driving` for car but it dosn't seem to make a difference
                }
                .padding()
            Toggle(isOn: $preferGoogle) {
                VStack(alignment: .leading){
                    Text("Using \(preferGoogle ? "Google" : "Apple") Maps")
                    Text("Toggle for \(preferGoogle ? "Apple" : "Google") Maps")
                        .italic()
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct ExamplesPage_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesPage()
    }
}

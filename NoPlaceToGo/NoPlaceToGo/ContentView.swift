//
//  ContentView.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/17/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pm: ProgressManager // swiftlint:disable:this identifier_name
    @State private var safeAreaBottom: CGFloat = 0.0 // changes with .onAppear

    var body: some View {
        GeometryReader {geo in
            VStack {
                PrimaryContent()
                Spacer()
                BackstageButton()
            }
            // The next two lines are to not resize around the keyboard
            // .ignoresSafeArea(.keyboard) is not available until iOS 14
            .padding(.bottom, safeAreaBottom)
            .edgesIgnoringSafeArea(.bottom) // .ignoresSafeArea(.keyboard) better but only iOS 14
            .onAppear {
                self.safeAreaBottom = geo.safeAreaInsets.bottom
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProgressManager())
    }
}

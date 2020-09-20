//
//  ContentView.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/17/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pm: ProgressManager
    @State private var safeAreaBottom: CGFloat = 0
    
    var body: some View {
        GeometryReader {geo in
            VStack{
                MainPage()
                Spacer() // keeps the info button at the bottom for less-than-full views
                MoreInfoButton()
                    .padding(.bottom, safeAreaBottom) // workaround for .ignoresSafeArea(.keyboard) not available until iOS 14
                    .onAppear {
                        self.safeAreaBottom = geo.safeAreaInsets.bottom
                    }
            }
            .edgesIgnoringSafeArea(.bottom)
            // .ignoresSafeArea(.keyboard) better but only iOS 14
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ProgressManager())
    }
}

struct MoreInfoButton: View {
    @State private var showSheet = false
    var body: some View {
        Button(action: {
            self.showSheet = true
        }) {
            Text("Backstage")
                .font(.custom(Fonts.Notable.rawValue, size: 24))
        }
        .foregroundColor(Color("PinkHeadings"))
        .sheet(isPresented: $showSheet) {
            MoreInfo()
        }
    }
}

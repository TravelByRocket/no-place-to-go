//
//  ContentView.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/17/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pm: ProgressManager
    
    var body: some View {
        VStack{
            MainPage()
            Spacer() // keeps the info button at the bottom for less-than-full views
            MoreInfoButton()
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

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
            HomePage()
            MoreInfoButton()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MoreInfoButton: View {
    @State private var showSheet = false
    var body: some View {
        Button(action: {
            self.showSheet = true
        }) {
            Text("Backstage")
                .font(.custom(Fonts.Notable.rawValue, size: 18))
        }
        .foregroundColor(Color(Colors.PinkHeadings.rawValue))
        .sheet(isPresented: $showSheet) {
            MoreInfo()
        }
    }
}

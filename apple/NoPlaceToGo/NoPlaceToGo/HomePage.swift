//
//  HomePage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var pm: ProgressManager
    @State private var showSheet = false
    
    
    var body: some View {
        VStack {
            EnterGroupPassword()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct SettingsButton: View {
    @EnvironmentObject var pm: ProgressManager
    var body: some View {
        Button(action: {
            self.pm.setCurrentPage(to: .settings)
            
        }) {
            HStack {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
    }
}

struct ArtistsButton: View {
    @EnvironmentObject var pm: ProgressManager
    var body: some View {
        Button(action: {
            self.pm.setCurrentPage(to: .artists)
            
        }) {
            HStack {
                Image(systemName: "person.3")
                Text("Artists")
            }
        }
    }
}

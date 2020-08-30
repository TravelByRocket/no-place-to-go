//
//  SettingsPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct SettingsPage: View {
    @EnvironmentObject var pm: ProgressManager
    @State private var preferGoogleMaps: Bool = UserDefaults.standard.bool(forKey: "preferGoogle")
    
    var body: some View {
        Form {
            Text("Enable Notifications PLACEHOLDER").italic().foregroundColor(.secondary)
            Text("Enable Location Services PLACEHOLDER").italic().foregroundColor(.secondary)
            Picker(selection: $preferGoogleMaps.onChange(saveDefault), label: Text("Map Provider")) { // this works but view does not update deeply until sheet is dismissed
                Text("Apple").tag(false)
                Text("Google").tag(true)
            }
        }
    .navigationBarTitle("Settings")
    }
    
    // part of `onChange` workaround, below
    func saveDefault(_ val: Bool) {
        print("got \(val)")
        UserDefaults.standard.set(val, forKey: "preferGoogle")
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

// Workaround for iOS 13 https://stackoverflow.com/questions/57518852/swiftui-picker-onchange-or-equivalent
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}

//
//  NextInstallationButton.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/3/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct NextInstallationButton: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    var messageNext: String = "Section Completed"
    
    @EnvironmentObject private var pm: ProgressManager
    
    var body: some View {
            VStack {
                Text(messageNext)
                    .font(.custom(Fonts.Notable.rawValue, size: 20))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .multilineTextAlignment(.center)
                Text("Hold to Advance")
                    .font(.custom(Fonts.Notable.rawValue, size: 14))
                    .foregroundColor(Color(Colors.Gold.rawValue))
            }
            .onLongPressGesture(minimumDuration: 2) {
                let _ = nextInstallation()
            }
    }
    
    func nextInstallation() -> Bool {
        if installIndex < numInstallsAtSite - 1 {
            installIndex += 1
            return true
        } else {
            return false
        }
    }
}

struct NextInstallationButton_Previews: PreviewProvider {
    static var previews: some View {
        NextInstallationButton(installIndex: .constant(0), numInstallsAtSite: 3)
    }
}

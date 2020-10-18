//
//  clownPopup.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/16/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ClownPopup: View {
    var body: some View {
        VStack {
            Image("clowntext")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("From: Surveillance Spa\nMessage: Timely Warning Notification of Suspicious Person")
                .padding()
            Text("If you have any information about this defected person, please inform The Ectoplasm immediately.\nYour belief will help create the fact!")
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1))
            
        }
    }
}

struct clownPopup_Previews: PreviewProvider {
    static var previews: some View {
        ClownPopup()
    }
}

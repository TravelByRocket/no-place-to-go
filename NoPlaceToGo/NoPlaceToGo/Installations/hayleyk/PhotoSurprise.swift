//
//  HayleyPhotoPush.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/3/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PhotoSurprise: View {
    @EnvironmentObject var pm: ProgressManager
    @Environment(\.presentationMode) var presentationMode
    
    var photoURL: String {
        let domain = "https://files.synodic.co/np2g/"
        let exactDate = Date()
        let calendar = Calendar.current
        var date = calendar.component(.day, from: exactDate)
        if (date < 16 || date > 31) {
            date = 16
        }
        let sourceURL = domain + "oct\(date)/" + pm.carGroup.asString + ".jpg"
        return sourceURL
    }
    
    var body: some View {
        VStack {
//            Text("Send notification later, maybe after next site complete, shows photo taken at site. URL root is \(photoURL)")
            Text("""
                We are so happy to see you!
                Please report any anxious
                persons and please
                sanitize now.
                """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .padding()
            RemoteImage(url: photoURL)
                .aspectRatio(contentMode: .fit)
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
                .font(.custom(fonts.ZCOOL, size: 22))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding(.horizontal, 40)
        }
    }
}

struct HayleyPhotoPush_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSurprise()
    }
}

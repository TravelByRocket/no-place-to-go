//
//  HayleyPhotoPush.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/3/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PhotoSurprise: View {
    @EnvironmentObject var pm: ProgressManager // swiftlint:disable:this identifier_name
    @Environment(\.presentationMode) var presentationMode

    var photoURL: String {
        let domain = "https://files.synodic.co/np2g/"
        let exactDate = Date()
        let calendar = Calendar.current
        var date = calendar.component(.day, from: exactDate)
        if date < 16 || date > 31 {
            date = 16
        }
        let sourceURL = domain + "oct\(date)/" + pm.carGroup.asString + ".jpg"
        return sourceURL
    }

    var isAfterEventDemo: Bool {
        let month = Calendar.current.component(.month, from: Date())
        let year = Calendar.current.component(.year, from: Date())
        return (month > 10 || year > 2020)
    }

    var body: some View {
        VStack {
            Text("""
                We are so happy to see you!
                Please report any anxious
                persons and please
                sanitize now.
                """)
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 24))
                .padding()
            if !isAfterEventDemo {
                RemoteImage(url: photoURL)
                    .aspectRatio(contentMode: .fit)
            } else {
                Image("photoboothexample")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Dismiss")
                .font(.custom(fonts.ZCOOL, size: 22))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Gold"))
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

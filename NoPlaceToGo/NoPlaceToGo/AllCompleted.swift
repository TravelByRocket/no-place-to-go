//
//  AllCompleted.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/3/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct AllCompleted: View {
    @State private var showSheet = false
    @State private var showSpyPhoto = false
    @State private var showSpyPhotoInstead = false
    @State private var showDonation = false
    @EnvironmentObject private var pm: ProgressManager
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            if (!showDonation) {
                Text("Thank you for joining us for No Place to Go! Where will you go next?\n\nYou can visit the NP2G Merch store tonight at Mint & Serif or at our online store at No-Place-To-Go.com!")
                    .padding()
                    .font(.custom(fonts.ZCOOL, size: 22))
                    .multilineTextAlignment(.center)
                Button(action: {
                    UIApplication.shared.open(URL(string: "https://www.no-place-to-go.com/shop/")!)
                }) {
                    Text("NP2G Merch Store")
                        .font(.custom(fonts.Notable, size: 24))
                        .foregroundColor(Color("PinkHeadings"))
                        .padding()
                }
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1))
                .padding()
            }
            Button(action: {
                showDonation.toggle()
            }) {
                Text(showDonation ? "Go Back" : "Donate to NP2G")
                    .font(.custom(fonts.Notable, size: 24))
                    .foregroundColor(Color("PinkHeadings"))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
            .sheet(isPresented: $showSheet, content: {
                DonatePage()
            })
            if (showDonation) {
                DonatePage()
            }
        }
        .sheet(isPresented: $showSpyPhoto){
            PhotoSurprise()
                .environmentObject(pm)
        }
        .onReceive(timer, perform: { _ in
            if(!pm.hasShownSpyPhoto) {
                pm.hasShownSpyPhoto = true
                showSpyPhoto = true
            }
        })
    }
}

struct AllCompleted_Previews: PreviewProvider {
    static var previews: some View {
        AllCompleted()
    }
}

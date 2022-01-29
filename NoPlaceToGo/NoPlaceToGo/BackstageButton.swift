//
//  BackstageButton.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 21 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct BackstageButton: View {
    @State private var showSheet = false
    var body: some View {
        Button {
            self.showSheet = true
        } label: {
            Text("Backstage")
                .font(.custom(fonts.Notable, size: 24))
        }
        .foregroundColor(Color("PinkHeadings"))
        .sheet(isPresented: $showSheet) {
            BackstagePage()
        }
    }
}

struct BackstageButton_Previews: PreviewProvider {
    static var previews: some View {
        BackstageButton()
            .previewLayout(.sizeThatFits)
    }
}

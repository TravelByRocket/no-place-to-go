//
//  StyledMap.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/3/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct StyledMap: View {
    @EnvironmentObject var pm: ProgressManager // swiftlint:disable:this identifier_name

    var body: some View {
        ZStack {
            Image("blankmap")
                .resizable()
                .aspectRatio(contentMode: .fit)
            if pm.completions.lamara || pm.curSite == .LamarA {
                Image("stevenmap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("bbsmap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("chrisygracemap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if pm.completions.lamarb || pm.curSite == .LamarB {
                Image("nicolemap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("nolanmap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if pm.completions.mintserif || pm.curSite == .MintSerif {
                Image("moehayleykmap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if pm.completions.tootsies || pm.curSite == .Tootsies {
                Image("tootsiesmap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            if pm.completions.musicrange || pm.curSite == .MusicRange {
                Image("emilymichaelamap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct StyledMap_Previews: PreviewProvider {
    static var previews: some View {
        StyledMap()
            .environmentObject(ProgressManager())
    }
}

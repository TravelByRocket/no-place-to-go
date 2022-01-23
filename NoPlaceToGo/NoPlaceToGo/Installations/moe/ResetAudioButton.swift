//
//  ResetAudioButton.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct ResetAudioButton: View {
    @Binding var isPlaying: Bool

    @EnvironmentObject private var am: AudioManager

    var body: some View {
        Button {
            am.audioPlayer?.currentTime = 0
        } label: {
            Image(systemName: "backward.end")
                .font(.largeTitle)
                .padding()
        }
    }
}


struct ResetAudioButton_Previews: PreviewProvider {
    @State private static var isPlaying = false

    static var previews: some View {
        ResetAudioButton(isPlaying: $isPlaying)
            .environmentObject(AudioManager())
            .previewLayout(.sizeThatFits)
    }
}

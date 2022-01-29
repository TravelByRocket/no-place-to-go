//
//  PauseAudio.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PauseAudioButton: View {
    @EnvironmentObject private var am: AudioManager // swiftlint:disable:this identifier_name
    @Binding var isPlaying: Bool
    @Binding var pausedManually: Bool

    var body: some View {
        Button {
            if self.isPlaying {
                self.am.pause()
                self.isPlaying = false
                self.pausedManually = true
            }
        } label: {
            Image(systemName: "pause")
                .font(.largeTitle)
                .padding()
        }
        .disabled(!isPlaying)
        .opacity(!isPlaying ? 0.3 : 1.0)
    }
}

struct PauseAudio_Previews: PreviewProvider {
    @State private static var isPlaying = false
    @State private static var pausedManually = false

    static var previews: some View {
        PauseAudioButton(isPlaying: $isPlaying, pausedManually: $pausedManually)
            .environmentObject(AudioManager())
            .previewLayout(.sizeThatFits)
    }
}

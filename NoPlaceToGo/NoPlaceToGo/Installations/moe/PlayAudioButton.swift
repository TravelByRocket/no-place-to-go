//
//  PlayAudioButton.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 23 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct PlayAudioButton: View {
    @Binding var isPlaying: Bool
    @Binding var pausedManually: Bool

    @EnvironmentObject private var am: AudioManager // swiftlint:disable:this identifier_name

    var body: some View {
        Button {
            if !self.isPlaying {
                self.am.play()
                self.isPlaying = true
                self.pausedManually = false
            }
        } label: {
            Image(systemName: "play")
                .font(.largeTitle)
                .padding()
        }
        .disabled(isPlaying)
        .opacity(isPlaying ? 0.3 : 1.0)
    }
}

struct PlayAudioButton_Previews: PreviewProvider {
    @State private static var isPlaying = false
    @State private static var pausedManually = false

    static var previews: some View {
        PlayAudioButton(isPlaying: $isPlaying, pausedManually: $pausedManually)
            .environmentObject(AudioManager())
            .previewLayout(.sizeThatFits)
    }
}

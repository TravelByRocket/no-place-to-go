//
//  MoeGraham.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI
import AVFoundation
import UserNotifications

struct MoeGraham: View {
    @Binding var installIndex: Int

    @EnvironmentObject private var am: AudioManager // swiftlint:disable:this identifier_name
    @State private var isPlaying = false // state is wrong if leaving the view and returning but this shouldn't happen
    @State private var pausedManually = true

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Spacer()
            Image("clownface")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onLongPressGesture(minimumDuration: 3) {
                    installIndex += 1
                }
            HStack {
                Group {
                    ResetAudioButton(isPlaying: $isPlaying)
                    PlayAudioButton(isPlaying: $isPlaying, pausedManually: $pausedManually)
                    PauseAudioButton(isPlaying: $isPlaying, pausedManually: $pausedManually)
                }
                .frame(width: 60, height: 60)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.secondary, lineWidth: 1))
                .padding(.horizontal, 20)
            }
            .foregroundColor(Color("Gold"))
            Spacer()
        }
        .onAppear {
            am.load(filename: "NP2G3.mp3", loop: false)
        }
        .onDisappear {
            am.stop()
        }
        .onReceive(timer, perform: { _ in
            if let playing = am.audioPlayer?.isPlaying {
                if isPlaying && !playing {
                    installIndex += 1
                }
            }
        })
    }
}

struct MoeGraham_Previews: PreviewProvider {
    static var previews: some View {
        MoeGraham(installIndex: .constant(1))
            .environmentObject(AudioManager())
    }
}

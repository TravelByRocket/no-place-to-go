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
//    private let player = MoePlayer()
    @Binding var installIndex: Int
    @EnvironmentObject private var am: AudioManager
    @State private var isPlaying = false // can show wrong state if leaving the view and coming back but this shouldn't happen anyway
    @State private var pausedManually = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Spacer()
            Image("clownface")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                Spacer()
                ResetAudio(isPlaying: $isPlaying)
                    .frame(width: 60)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.secondary, lineWidth: 1))
                    .padding()
                Spacer()
                PlayAudio(isPlaying: $isPlaying, pausedManually: $pausedManually)
                    .frame(width: 60)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.secondary, lineWidth: 1))
                    .padding()
                    .onLongPressGesture(minimumDuration: 4) {
                        installIndex += 1
                    }
                Spacer()
                PauseAudio(isPlaying: $isPlaying, pausedManually: $pausedManually)
                    .frame(width: 60)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.secondary, lineWidth: 1))
                    .padding()
                Spacer()
            }
            .foregroundColor(Color(Colors.Gold.rawValue))
            Spacer()
        }
        .onAppear{
            am.load(filename: "NP2G3.mp3", loop: false)
        }
        .onDisappear{
            am.stop()
        }
        .onReceive(timer, perform: { _ in
            if let playing = am.audioPlayer?.isPlaying {
                if (isPlaying && !playing) {
                    installIndex += 1
                }
            }
        })
    }
}

//struct MoeGraham_Previews: PreviewProvider {
//    static var previews: some View {
//        MoeGraham()
//    }
//}

fileprivate struct ResetAudio: View {
    @EnvironmentObject private var am: AudioManager
    @Binding var isPlaying: Bool
    var body: some View {
        Button(action: {
            am.audioPlayer?.currentTime = 0
        }, label: {
            Image(systemName: "backward.end")
                .font(.title)
                .padding()
        })
    }
}

fileprivate struct PlayAudio: View {
    @EnvironmentObject private var am: AudioManager
    @Binding var isPlaying: Bool
    @Binding var pausedManually: Bool
    var body: some View {
        Button(action: {
            if !self.isPlaying {
                self.am.play()
                self.isPlaying = true
                self.pausedManually = false
            }
        }) {
            Image(systemName: "play")
                .font(.largeTitle)
                .padding()
        }
        .disabled(isPlaying)
        .opacity(isPlaying ? 0.3 : 1.0)
    }
}

fileprivate struct PauseAudio: View {
    @EnvironmentObject private var am: AudioManager
    @Binding var isPlaying: Bool
    @Binding var pausedManually: Bool
    var body: some View {
        Button(action: {
            if self.isPlaying {
                self.am.pause()
                self.isPlaying = false
                self.pausedManually = true
            }
        }) {
            Image(systemName: "pause")
                .font(.largeTitle)
                .padding()
        }
        .disabled(!isPlaying)
        .opacity(!isPlaying ? 0.3 : 1.0)
    }
}

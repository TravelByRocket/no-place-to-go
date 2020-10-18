//
//  AudioManager.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/9/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import Foundation
import AVFoundation

class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    init() {
        // Get the audio session singleton instance.
        let audioSession = AVAudioSession.sharedInstance()
        do {
            // Set the audio session category, mode, and options.
            try audioSession.setCategory(.playback, mode: .spokenAudio, options: [])
            print("Playback OK")
            try audioSession.setActive(true)
            print("Session is Active")
        } catch {
            print("Failed to set audio session category.")
        }
    }
    
    func load(filename: String, loop: Bool) {
        let path = Bundle.main.path(forResource: filename, ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = loop ? -1 : 0
        } catch {
            print("couldn't load file")
        }
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func pause() {
        audioPlayer?.pause()
    }
    
    func stop() {
        audioPlayer?.stop()
    }
}

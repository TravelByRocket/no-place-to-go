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
    private let player = moeplayer()
    @State private var isPlaying = false // can show wrong state if leaving the view and coming back but this shouldn't happen anyway
    var body: some View {
        VStack {
            Spacer()
            Image("clownface")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                ResetAudio(player: player, isPlaying: $isPlaying)
                PlayPause(player: player, isPlaying: $isPlaying)
            }
            Text("Notifications at random times to play clown sound")
            Spacer()
            VStack {
                Button("Request Permission") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }

                Button("Schedule Notification") {
                    let content = UNMutableNotificationContent()
                    content.title = "Feed the cat"
                    content.subtitle = "It looks hungry"
                    content.sound = UNNotificationSound.default

                    // show this notification five seconds from now
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                    // choose a random identifier
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                    // add our notification request
                    UNUserNotificationCenter.current().add(request)
                }
            }
        }
    }
}

struct MoeGraham_Previews: PreviewProvider {
    static var previews: some View {
        MoeGraham()
    }
}

fileprivate class moeplayer { // make Singleton perhaps
    var clownstory: AVAudioPlayer?
    
    init() {
        let path = Bundle.main.path(forResource: "laptophumlong.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            clownstory = try AVAudioPlayer(contentsOf: url)
            //            clownstory?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func play() {
        clownstory?.play()
    }
    
    func pause() {
        clownstory?.pause()
    }
    
    func stop() {
        clownstory?.stop()
    }
}

fileprivate struct ResetAudio: View {
    var player: moeplayer
    @Binding var isPlaying: Bool
    var body: some View {
        Button(action: {
            self.player.stop()
            self.isPlaying = false
        }, label: {
            Image(systemName: "gobackward")
                .font(.title)
                .padding()
        })
            .disabled(!isPlaying)
    }
}

fileprivate struct PlayPause: View {
    var player: moeplayer
    @Binding var isPlaying: Bool
    var body: some View {
        Button(action: {
            if self.isPlaying {
                self.player.pause()
            } else {
                self.player.play()
            }
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause" : "play")
                .font(.largeTitle)
                .padding()
        }
    }
}

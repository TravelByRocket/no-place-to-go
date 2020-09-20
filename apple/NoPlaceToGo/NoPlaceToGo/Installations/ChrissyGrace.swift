//
//  ChrissyGrace.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ChrissyGrace: View {
    @State var timeRemaining = 60*3
    
    private let player = chrissygraceplayer()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("App should look like it's crashing")
            Text("System restoring in \(timeRemaining) seconds")
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
            }
        }
        .foregroundColor(.pink)
        .onAppear {
            self.player.play()
        }
        .onDisappear {
            self.player.stop()
        }
    }
    
}

struct ChrissyGrace_Previews: PreviewProvider {
    static var previews: some View {
        ChrissyGrace()
    }
}

fileprivate class chrissygraceplayer { // make Singleton perhaps
    var background: AVAudioPlayer?
    
    init() {
        let path = Bundle.main.path(forResource: "sleepsound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            background = try AVAudioPlayer(contentsOf: url)
            //            clownstory?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func play() {
        background?.play()
    }
    
    func pause() {
        background?.pause()
    }
    
    func stop() {
        background?.stop()
    }
}

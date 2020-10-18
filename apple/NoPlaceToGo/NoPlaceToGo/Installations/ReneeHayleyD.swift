//
//  ReneeHayleyD.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ReneeHayleyD: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    
    @State private var treeIndex: Int = 0
    
    @State private var accent = EnglishAccents.us
    @State private var callStatus = CallStatus.incoming
    
    private let pt: [phoneTreeNode] = treeFromCSV(filename: "phonetree.csv")
    private let synthesizer = AVSpeechSynthesizer()
    private var node: phoneTreeNode {
        pt[treeIndex]
    }
    
    private var canHangup: Bool {
        !synthesizer.isSpeaking && callStatus == .completed
    }
    
    func readMessage() {
        if self.synthesizer.isSpeaking {
            self.synthesizer.stopSpeaking(at: .immediate)
        }
        
        let utterance = AVSpeechUtterance(string: self.pt[self.treeIndex].content)
        utterance.voice = AVSpeechSynthesisVoice(language: accent.rawValue)
        utterance.rate = 0.50
        self.synthesizer.speak(utterance)
    }
    
    func processKeyPress(for number: Int) {
        if let newIndex = self.node.keypress[number > 0 ? number - 1 : 9] {
            print(pt[newIndex].keypress[0] == nil)
            self.treeIndex = newIndex
            readMessage()
            if pt[newIndex].keypress[0] == nil{ // isTerminal does not seem to be working
                callStatus = .completed
                print("call is set to completed")
            }
        }
    }
    
    var body: some View {
        
        if (callStatus == .incoming) {
            Button(action: {callStatus = .active}) {
                VStack {
                    Spacer()
                    Text("Incoming Call... touch to answer")
                        .italic()
                        .padding()
                    HStack {
                        Text("The Placement Service")
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .padding()
                        Spacer()
                        Image(systemName: "phone.arrow.up.right")
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.white)
                            .mask(Circle())
                            .padding()
                    }
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2)
                    )
                    Spacer()
                }
                .padding()
            }
        } else if (callStatus == .active || callStatus == .completed){
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    VStack {
                        HStack {
                            NumKey(number: 1, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 1) }
                            NumKey(number: 2, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 2) }
                            NumKey(number: 3, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 3) }
                        }
                        .opacity(callStatus == .active ? 1.0 : 0.2)
                        HStack {
                            NumKey(number: 4, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 4) }
                            NumKey(number: 5, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 5) }
                            NumKey(number: 6, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 6) }
                        }
                        .opacity(callStatus == .active ? 1.0 : 0.2)
                        HStack {
                            NumKey(number: 7, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 7) }
                            NumKey(number: 8, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 8) }
                            NumKey(number: 9, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 9) }
                        }
                        .opacity(callStatus == .active ? 1.0 : 0.2)
                        HStack{
                            RepeatKey()
                                .onTapGesture { readMessage() }
                            NumKey(number: 0, treeIndex: $treeIndex, node: node)
                                .onTapGesture { processKeyPress(for: 0) }
                                .opacity(callStatus == .active ? 1.0 : 0.2)
                            HangupKey()
                                .onTapGesture {
                                if self.synthesizer.isSpeaking {
                                    self.synthesizer.stopSpeaking(at: .immediate)
                                }
                                    callStatus = .ended
                                }
                                .disabled(callStatus != .completed)
                                .opacity(callStatus == .completed ? 1.0 : 0.2)
                        }
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 2))
                    .onAppear{
                        readMessage()
                    }
                    Spacer()
                }
                Spacer()
            }
        } else if (callStatus == .ended) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Goodbye")
                            .font(.custom(Fonts.Notable.rawValue, size: 20))
                            .foregroundColor(Color("PinkHeadings"))
                        Image("phonecapture")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
                Spacer()
                NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
            }
        }
    }
    
    struct NumKey: View {
        let number: Int
        @Binding var treeIndex: Int
        let node: phoneTreeNode
        
        var body: some View {
            Text("\(number)")
                .frame(width: 50, height:50)
                .font(.largeTitle)
                .padding()
                .background(Color.blue)
                .mask(RoundedRectangle(cornerRadius: 15))
                .padding(4)
        }
    }
    
    struct RepeatKey: View {
        var body: some View {
            Image(systemName: "gobackward")
                .frame(width: 50, height:50)
                .font(.largeTitle)
                .padding()
                .background(Color.blue)
                .mask(Circle())
                .padding(4)
        }
    }
    
    struct HangupKey: View {
        var body: some View {
            Image(systemName: "phone.arrow.up.right")
                .frame(width: 50, height:50)
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .mask(Circle())
                .foregroundColor(.red)
                .padding(4)
        }
    }
    
    enum EnglishAccents: String {
        case au = "en-AU"
        case gb = "en-GB"
        case ie = "en-IE"
        case us = "en-US"
        case za = "en-ZA"
    }
    
    enum CallStatus: String {
        case incoming
        case active
        case completed
        case ended
    }
    
    //    func disableAVSession() {
    //        do {
    //            try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    //        } catch {
    //            print("audioSession properties weren't disable.")
    //        }
    //    }
}

//struct ReneeHayleyD_Previews: PreviewProvider {
//    static var previews: some View {
//        ReneeHayleyD()
//            .environment(\.colorScheme, .light)
//    }
//}

struct phoneTreeNode {
    let content: String
    let isTerminal: Bool
    let keypress: [Int?]
}

func csv(data: String) -> [[String]] {
    var result: [[String]] = []
    let rows = data.components(separatedBy: "\n")
    for row in rows {
        let columns = row.components(separatedBy: ";")
        print(columns)
        result.append(columns)
    }
    return result
}

func arrayOfStringsToTreeNode(_ row: [String]) -> phoneTreeNode {
    var content: String = ""
    var isTerminal: Bool = false
    var keyMap: [Int?] = Array(repeating: nil, count: 10)
    for index in 0 ..< 7 {
        if index == 0 {
            content = row[index]
        } else if index == 1 {
            isTerminal = Bool(row[index]) ?? false
        } else {
            keyMap[index - 2] = Int(row[index])
        }
    }
    return phoneTreeNode(content: content, isTerminal: isTerminal, keypress: keyMap)
}

func treeFromCSV(filename: String) -> [phoneTreeNode] {
    if let filepath = Bundle.main.path(forResource: filename, ofType: nil) {
        do {
            let contents = try String(contentsOfFile: filepath)
            print(contents)
            let parsed = csv(data: contents)
            var results: [phoneTreeNode] = []
            for item in parsed {
                let result = arrayOfStringsToTreeNode(item)
                results.append(result)
            }
            return results
        } catch {
            // contents could not be loaded
        }
    } else {
        // example.txt not found!
    }
    
    return [phoneTreeNode(content: "content", isTerminal: false, keypress: [nil])]
}

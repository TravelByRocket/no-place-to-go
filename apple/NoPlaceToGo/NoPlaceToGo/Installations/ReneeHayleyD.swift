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
    
    @State private var treeIndex: Int = 0
    @State private var readyToHangUp = false
    
    fileprivate let pt: [phoneTreeNodeAlt] = treeFromCSV(filename: "phonetree.csv")
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            ScrollView {
                Button(action: {
                    if self.synthesizer.isSpeaking {
                        self.synthesizer.stopSpeaking(at: .immediate)
                    }
                    
                    let utterance = AVSpeechUtterance(string: self.pt[self.treeIndex].content)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    utterance.rate = 0.50
                    self.synthesizer.speak(utterance)
                }) {
                Text("Speak Text Below")
                }
                Text(pt[treeIndex].content)
                Text("\n Press X to repeat this message")
            }
            if readyToHangUp {
                Button(action: {
                    
                }) {
                Text("Press to Hang Up")
                }
            } else {
                NumPad(treeIndex: $treeIndex, node: pt[treeIndex])
            }
            
        }
    }
}

struct ReneeHayleyD_Previews: PreviewProvider {
    static var previews: some View {
        ReneeHayleyD()
            .environment(\.colorScheme, .light)
    }
}

fileprivate struct NumPad: View {
    @Binding var treeIndex: Int
    let node: phoneTreeNodeAlt
    
    var body: some View {
        VStack {
            HStack {
                NumKey(number: 1, treeIndex: $treeIndex, node: node)
                NumKey(number: 2, treeIndex: $treeIndex, node: node)
                NumKey(number: 3, treeIndex: $treeIndex, node: node)
            }
            HStack {
                NumKey(number: 4, treeIndex: $treeIndex, node: node)
                NumKey(number: 5, treeIndex: $treeIndex, node: node)
                NumKey(number: 6, treeIndex: $treeIndex, node: node)
            }
            HStack {
                NumKey(number: 7, treeIndex: $treeIndex, node: node)
                NumKey(number: 8, treeIndex: $treeIndex, node: node)
                NumKey(number: 9, treeIndex: $treeIndex, node: node)
            }
            HStack{
                NumKey(number: 0, treeIndex: $treeIndex, node: node)
            }
        }
    }
}

fileprivate struct NumKey: View {
    let number: Int
    @Binding var treeIndex: Int
    let node: phoneTreeNodeAlt
    
    var body: some View {
        Text("\(number)")
            .frame(width: 50, height:50)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .mask(RoundedRectangle(cornerRadius: 15))
            .padding(4)
            .onTapGesture {
                if let newIndex = self.node.keypress[self.number > 0 ? self.number - 1 : 9] {
                    self.treeIndex = newIndex
                }
        }
    }
}

fileprivate struct phoneTreeNode {
    let content: String
    let isTerminal: Bool
    let keypress: [Int: Int]
}

fileprivate struct phoneTreeNodeAlt {
    let content: String
    let isTerminal: Bool
    let keypress: [Int?]
}

fileprivate let phoneTree: [Int: phoneTreeNode] = [
    0: phoneTreeNode(content: "the content", isTerminal: false, keypress: [0: 1,
                                                                           1: 2])
]

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

fileprivate func arrayOfStringsToTreeNode(_ row: [String]) -> phoneTreeNodeAlt {
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
    return phoneTreeNodeAlt(content: content, isTerminal: isTerminal, keypress: keyMap)
}

fileprivate func treeFromCSV(filename: String) -> [phoneTreeNodeAlt] {
    if let filepath = Bundle.main.path(forResource: filename, ofType: nil) {
        do {
            let contents = try String(contentsOfFile: filepath)
            print(contents)
            let parsed = csv(data: contents)
            var results: [phoneTreeNodeAlt] = []
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
    
    return [phoneTreeNodeAlt(content: "content", isTerminal: false, keypress: [nil])]
}

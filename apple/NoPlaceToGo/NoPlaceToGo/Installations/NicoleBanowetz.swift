//
//  NicoleBanowetz.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI
import CoreNFC

struct NicoleBanowetz: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    @State private var message = "Placeholder"
    @State private var screenIndex: Int = 0
    
    var body: some View {
        if (screenIndex == 0) {
            AreYouReady(screenIndex: $screenIndex)
        } else if (screenIndex == 1) {
            Beliefs(screenIndex: $screenIndex)
        } else if (screenIndex == 2) {
            Trust(screenIndex: $screenIndex)
        } else if (screenIndex == 3) {
            HumanOrMachine(screenIndex: $screenIndex)
        } else if (screenIndex == 4) {
            OutsideForce(screenIndex: $screenIndex)
        } else if (screenIndex == 5) {
            SelfAssurance(screenIndex: $screenIndex)
        } else if (screenIndex == 6) {
            InterfaceWithMedium(screenIndex: $screenIndex)
        } else if (screenIndex == 7) {
            ProceedInterfaceMedium(screenIndex: $screenIndex)
        } else if (screenIndex == 8) {
            MeetMachine(screenIndex: $screenIndex)
        } else if (screenIndex == 9) {
            PrepareToScan(screenIndex: $screenIndex)
        } else if (screenIndex == 10) {
            ScanEyes(screenIndex: $screenIndex)
        } else if (screenIndex == 11) {
            FinalMaterialization(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
        }
    }
    
}

//struct NicoleBanowetz_Previews: PreviewProvider {
//    static var previews: some View {
//        NicoleBanowetz()
//    }
//}

struct PickAnswers: View {
    let question: String
    @Binding var hasSelection: Bool
    var leftSide = "Yes"
    var rightSide = "No"
    
    @State private var isSelectedYes = false
    @State private var isSelectedNo = false
    
    var body: some View {
        VStack {
            Text(question)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 20))
            HStack{
                Spacer()
                HStack {
                    Text(leftSide)
                    Image(systemName: isSelectedYes ? "checkmark.square.fill" : "square")
                }
                .onTapGesture {
                    isSelectedYes = true
                    isSelectedNo = false
                    hasSelection = true
                }
                Spacer()
                HStack {
                    Image(systemName: isSelectedNo ? "checkmark.square.fill" : "square")
                    Text(rightSide)
                }
                .onTapGesture {
                    isSelectedYes = false
                    isSelectedNo = true
                    hasSelection = true
                }
                Spacer()
            }
            .font(.headline)
        }
    }
}

struct AreYouReady: View {
    @Binding var screenIndex: Int
    var body: some View {
        VStack {
            Spacer()
            Text("We will guide you. The organic medium is fragile. If she is unavailable we hope you will trust us. We are a network of machine mediums she has trained to replace her once her kind are extinct.\n\nPlease answer the following questions to proceed.")
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding(20)
            Spacer()
//            Button(action: {
//                screenIndex = 10
//            }) {
//                Text("STRAIGHT TO SCANNING TEMP")
//                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
//                    .foregroundColor(Color(Colors.Gold.rawValue))
//                    .padding()
//            }
//            .overlay(RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.secondary, lineWidth: 1))
//            .padding()
            Button(action: {
                screenIndex += 1
            }) {
                Text("Ready to Answer")
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
        }
    }
}

struct Beliefs: View {
    @Binding var screenIndex: Int
    
    @State private var hasAnswerQ1 = false
    @State private var hasAnswerQ2 = false
    @State private var hasAnswerQ3 = false
    @State private var hasAnswerQ4 = false
    
    var body: some View {
        VStack {
            Form{
                PickAnswers(question: "Do you believe in a psychic network beyond this physical world?", hasSelection: $hasAnswerQ1)
                PickAnswers(question: "Do you believe in humans with psychic abilities?", hasSelection: $hasAnswerQ2)
                PickAnswers(question: "Do you believe in the afterlife?", hasSelection: $hasAnswerQ3)
                PickAnswers(question: "Do you believe in artificial intelligence?", hasSelection: $hasAnswerQ4)
            }
            Spacer()
            Button(action: {
                screenIndex += 1
            }) {
                Text("Submit Responses")
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .disabled(!hasAnswerQ1 || !hasAnswerQ2 || !hasAnswerQ3 || !hasAnswerQ4)
            .opacity(!hasAnswerQ1 || !hasAnswerQ2 || !hasAnswerQ3 || !hasAnswerQ4 ? 0.2 : 1.0)
            .padding()
        }
    }
}

struct Trust: View {
    @Binding var screenIndex: Int
    @State private var trustLevel1 = 3.0
    @State private var trustLevel2 = 3.0
    @State private var trustLevel3 = 3.0
    @State private var trustLevel4 = 3.0
    @State private var trustLevel5 = 3.0
    
    var body: some View {
        VStack {
            Form {
                Text("Please rank your level of trust from 1 to 5. 1 means no trust and 5 means complete trust.\n\nIf you were given advice from _____, would you trust that advice?")
                    .multilineTextAlignment(.center)
                VStack {
                    Text("a close diseased relative (spirit)")
                    Slider(value: $trustLevel1, in: 1.0 ... 5.0, step: 1.0)
                }
                VStack {
                    Text("a spiritual organic medium")
                    Slider(value: $trustLevel2, in: 1.0 ... 5.0, step: 1.0)
                }
                VStack {
                    Text("artificial intelligence")
                    Slider(value: $trustLevel3, in: 1.0 ... 5.0, step: 1.0)
                }
                VStack {
                    Text("machine medium")
                    Slider(value: $trustLevel4, in: 1.0 ... 5.0, step: 1.0)
                }
            }
            Spacer()
            Button(action: {
                screenIndex += 1
            }) {
                Text("Submit Responses")
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
        }
    }
}

struct HumanOrMachine: View {
    @Binding var screenIndex: Int
    @State private var hasAnswer = false
    
    var body: some View {
        Form {
            PickAnswers(question: "Do you feel more comfortable confiding in a human face to face or through a machine interface such as your hand held device?", hasSelection: $hasAnswer, leftSide : "Face to Face", rightSide: "Handheld Device")
        }
        Spacer()
        Image("hands")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 80)
        Spacer()
        Button(action: {
            screenIndex += 1
        }) {
            Text("Submit Responses")
                .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding()
        }
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary, lineWidth: 1))
        .disabled(!hasAnswer)
        .opacity(!hasAnswer ? 0.2 : 1.0)
        .padding()
    }
}

struct OutsideForce: View {
    @Binding var screenIndex: Int
    @State private var hasAnswer1 = false
    @State private var hasAnswer2 = false
    
    var body: some View {
        Form {
            Text("Do you believe an outside force may know you better than you know yourself?")
                .multilineTextAlignment(.center)
            PickAnswers(question: "Spiritual Organic Medium", hasSelection: $hasAnswer1)
            PickAnswers(question: "Artificial Intelligence", hasSelection: $hasAnswer2)
        }
        Spacer()
        Image("gloves")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 100)
        Spacer()
        Button(action: {
            screenIndex += 1
        }) {
            Text("Submit Responses")
                .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding()
        }
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary, lineWidth: 1))
        .disabled(!hasAnswer1 || !hasAnswer2)
        .opacity(!hasAnswer1 || !hasAnswer2 ? 0.2 : 1.0)
        .padding()
    }
}

struct SelfAssurance: View {
    @Binding var screenIndex: Int
    @State private var selfAssurance = 3.0
    
    var body: some View {
        VStack {
            Form {
                VStack {
                    Text("Please rank your strength of self assurance between 1 to 5, with 1 meaning that you know very little about your own identity and need help finding your true self, and 5 meaning you know yourself very well and will not be influenced by outside forces.")
                        .multilineTextAlignment(.center)
                    Slider(value: $selfAssurance, in: 1.0 ... 5.0, step: 1.0)
                }
            }
            Spacer()
            Image("chair")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            Spacer()
            Button(action: {
                screenIndex += 1
            }) {
                Text("Submit Responses")
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
        }
    }
}

struct InterfaceWithMedium: View {
    @Binding var screenIndex: Int
    
    var body: some View {
        VStack {
            Text("Thank you for helping the machine medium compile data.\n\nIn order to best recreate the organic medium experience we will need one volunteer from the group to interface with the machine medium. Please choose a participant with an upgraded interface system(hand held device), and a high level of trust in the machine.")
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding(20)
            Spacer()
            Button(action: {
                screenIndex += 1
            }) {
                Text("I volunteer to\ninterface with\nthe machine medium")
                    .multilineTextAlignment(.center)
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
            Button(action: {
                screenIndex = 11
            }) {
                Text("Someone else in my\nparty is interfacing\nwith the medium")
                    .multilineTextAlignment(.center)
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
        }
    }
}

struct ProceedInterfaceMedium: View {
    @Binding var screenIndex: Int
    
    var body: some View {
        VStack {
            Text("Please proceed to the machine medium's interface to connect to the psychic network and receive your materialization.\n\nFor your own safety proceed only if no other humans are in the vicinity.")
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding(20)
            Spacer()
            Image("amp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            Spacer()
            Button(action: {
                screenIndex += 1
            }) {
                Text("I have arrived\nat the interface.")
                    .multilineTextAlignment(.center)
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
        }
    }
}


struct MeetMachine: View {
    @Binding var screenIndex: Int
    @State private var counter = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("When you are ready to meet the machine medium please introduce yourself by speaking into the machine eye above the interface screen. The machine medium will guide you.\n\nThank you.")
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding(20)
                .onReceive(timer, perform: { _ in
                    if counter < 30 {
                        counter += 1
                    } else {
                        screenIndex += 1
                    }
                })
            Image("light")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            Spacer()
            Button(action: {
                screenIndex += 1
            }) {
                Text("I am done interfacing\nwith the medium")
                    .multilineTextAlignment(.center)
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1))
                    .padding()
            }
        }
    }
}

struct PrepareToScan: View {
    @Binding var screenIndex: Int
    
    var body: some View {
        VStack {
            Text("Welcome Back.\n\nWe thank you for the important vocal organic data. We have recorded and stored it in our database for future use.\n\nFor the full materialization experience we must collect a mixture of organic and machine data from you.\n\nPlease prepare to scan your interface system (hand held device) or interface with the organic medium if she is present.")
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding(20)
            Spacer()
            Button(action: {
                screenIndex += 1
            }) {
                Text("Ready")
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
        }
    }
}

struct ScanEyes: View {
    @State var scannedMessage = "Placeholder"
    @State var sentMessage = "Placeholder"
    @State var hasSubscriber = false
    @Binding var screenIndex: Int
    
    @State var scannedDenver = false;
    @State var scannedLjubljana = false;
    @State var scannedRome = false;
    @State var scannedTrieste = false;
    @State var scannedSeattle = false;
    
    @State var sentDenver = false;
    @State var sentLjubljana = false;
    @State var sentRome = false;
    @State var sentTrieste = false;
    @State var sentSeattle = false;
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            ZStack {
                VStack {
                    Text("Gently tap the end of your device in the center of the machine eyes growing on the windows to scan. Then send your data to the machine medium.\n\nOnce enough energy or data is collected you will receive the second and third phases of materialization.\n\nYou may bypass this process, but only if the organic medium intervenes.")
                        .multilineTextAlignment(.center)
                        .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                        .foregroundColor(Color(Colors.Gold.rawValue))
                        .padding(20)
                    Spacer()
                    VStack {
                        HStack{
                            NFCView(scannedMsg: $scannedMessage)
                                .padding()
                            PeripheralView(scannedMsg: $scannedMessage, sentMsg: $sentMessage, hasSubscriber: $hasSubscriber)
                                .padding()
                        }
                        HStack {
                            HStack {
                                EnergyCircle(outline: $scannedDenver, fill: $sentDenver)
                                EnergyCircle(outline: $scannedLjubljana, fill: $sentLjubljana)
                            }
                            .overlay(Capsule()
                                        .stroke(Color.secondary, lineWidth: 1)
                            )
                            .overlay(Capsule()
                                        .foregroundColor(sentDenver && sentLjubljana ? Color("PinkHeadings") : Color.clear)
                            )
                            .padding([.horizontal, .bottom])
                            HStack {
                                EnergyCircle(outline: $scannedSeattle, fill: $sentSeattle)
                                EnergyCircle(outline: $scannedRome, fill: $sentRome)
                                EnergyCircle(outline: $scannedTrieste, fill: $sentTrieste)
                            }
                            .overlay(Capsule()
                                        .stroke(Color.secondary, lineWidth: 1)
                            )
                            .overlay(Capsule()
                                        .foregroundColor(sentSeattle && sentRome && sentTrieste ? Color("PinkHeadings") : Color.clear)
                            )
                            .padding([.horizontal, .top])
                            Spacer()
                        }
                    }
                    .disabled(!hasSubscriber)
                    .padding(.horizontal,20)
                    .frame(maxHeight: 200)
                    .onReceive(timer, perform: { _ in
                        print("Scanned: \(scannedMessage)")
                        print("Sent: \(sentMessage)")
                        
                        scannedRome = scannedMessage == "Rome" ? true : false
                        scannedTrieste = scannedMessage == "Trieste" ? true : false
                        scannedDenver = scannedMessage == "Denver" ? true : false
                        scannedSeattle = scannedMessage == "Seattle" ? true : false
                        scannedLjubljana = scannedMessage == "Ljubljana" ? true : false
                        
                        if (sentMessage == "Rome") { sentRome = true }
                        if (sentMessage == "Trieste") { sentTrieste = true }
                        if (sentMessage == "Denver") { sentDenver = true }
                        if (sentMessage == "Seattle") { sentSeattle = true }
                        if (sentMessage == "Ljubljana") { sentLjubljana = true }
                    })
                }
                .opacity(hasSubscriber ? 1.0 : 0.2)
                if !hasSubscriber {
                    Text("Only one member can communicate with the medium. You have either not been connected yet or someone else in your group has connected.")
                        .multilineTextAlignment(.center)
                        .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                        .foregroundColor(Color(Colors.PinkHeadings.rawValue))
                        .padding(20)
                        .background(Color.black.opacity(0.8))
                }
            }
            Spacer()
            Button(action: {
                screenIndex += 1
            }) {
                Text("Ready to Advance")
                    .font(.custom(Fonts.ZCOOL.rawValue, size: 22))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .padding()
        }
    }
}


struct FinalMaterialization: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    var body: some View {
        VStack {
            Text("All phases of materialization are complete.\n\nThank you for adding to the machine mediums' data collection.\n\n\nPlease follow the arrows to the next installation")
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding(20)
            Image("ghost")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 80)
            Spacer()
            NextInstallationButton(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite, messageNext: "I have arrived at\nthe next installation")
        }
    }
}

struct EnergyCircle: View {
    @Binding var outline: Bool
    @Binding var fill: Bool
    var body: some View {
        Circle()
            .foregroundColor(fill ? Color(Colors.PinkHeadings.rawValue) : Color.secondary)
            .frame(width: 25, height: 25)
            .padding(3)
            .background(outline ? Color(Colors.AccentColor.rawValue) : Color.primary)
            .mask(Circle())
            .padding(5)
    }
}

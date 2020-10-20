//
//  NicoleBanowetz.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/5/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct NicoleBanowetz: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    @State private var screenIndex: Int = 0
    
    var body: some View {
        if (screenIndex == 0) {
            Screen01BeforeProceeding(screenIndex: $screenIndex)
        } else if (screenIndex == 1) {
            Screen02Trust(screenIndex: $screenIndex)
        } else if (screenIndex == 2) {
            Screen03HumanOrMachine(screenIndex: $screenIndex)
        } else if (screenIndex == 3) {
            Screen04OutsideForce(screenIndex: $screenIndex)
        } else if (screenIndex == 4) {
            Screen05InterfaceWithMedium(screenIndex: $screenIndex)
        } else if (screenIndex == 5) {
            Screen06ProceedInterfaceMedium(screenIndex: $screenIndex)
        } else if (screenIndex == 6) {
            Screen07MeetMachine(screenIndex: $screenIndex)
        } else if (screenIndex == 7) {
            Screen08HaveRecorded(screenIndex: $screenIndex)
        } else if (screenIndex == 8) {
            Screen09FinalMaterialization(installIndex: $installIndex, numInstallsAtSite: numInstallsAtSite)
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
                .padding(.bottom, 5)
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

struct Screen01BeforeProceeding: View {
    @Binding var screenIndex: Int
    var body: some View {
        VStack {
            Spacer()
            Text("""
                Stop.

                Before approaching the medium you must you must answer a series of questions.

                We will guide you. The organic medium is fragile. If she is unavailable we hope you will trust us. We are a network of machine mediums she has trained to replace her once her kind are extinct.
                """)
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding(20)
            Spacer()
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

struct Screen02Trust: View {
    @Binding var screenIndex: Int
    @State private var trustLevel1 = 3.0
    @State private var trustLevel2 = 3.0
    @State private var trustLevel3 = 3.0
    @State private var trustLevel4 = 3.0
    @State private var trustLevel5 = 3.0
    
    var body: some View {
        VStack {
            Text("""
                    Please indicate your level of trust, 1 meaning no trust and 5 meaning complete trust.
                    
                    If you were given advice from _____, would you trust that advice?
                    """)
                .multilineTextAlignment(.center)
                .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
                .foregroundColor(Color(Colors.Gold.rawValue))
                .padding(20)
            Form {
                VStack {
                    Text("Close deceased relative (Spirit)")
                    HStack {
                        Text("Less\nTrust")
                        Slider(value: $trustLevel1, in: 1.0 ... 5.0, step: 1.0)
                        Text("More\nTrust")
                    }
                    
                }
                VStack {
                    Text("Spiritual Organic Medium")
                    HStack {
                        Text("Less\nTrust")
                        Slider(value: $trustLevel2, in: 1.0 ... 5.0, step: 1.0)
                        Text("More\nTrust")
                    }
                }
                VStack {
                    Text("Artificial Intelligence")
                    HStack {
                        Text("Less\nTrust")
                        Slider(value: $trustLevel3, in: 1.0 ... 5.0, step: 1.0)
                        Text("More\nTrust")
                    }
                }
                VStack {
                    Text("Machine Medium")
                    HStack {
                        Text("Less\nTrust")
                        Slider(value: $trustLevel4, in: 1.0 ... 5.0, step: 1.0)
                        Text("More\nTrust")
                    }
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

struct Screen03HumanOrMachine: View {
    @Binding var screenIndex: Int
    @State private var hasAnswer = false
    
    var body: some View {
        Text("Do you feel more comfortable confiding in a human face to face or through a machine interface such as your hand held device?")
            .multilineTextAlignment(.center)
            .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
            .foregroundColor(Color(Colors.Gold.rawValue))
            .padding(20)
        Form {
            PickAnswers(question: "I prefer...", hasSelection: $hasAnswer, leftSide : "Face to Face", rightSide: "Handheld Device")
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

struct Screen04OutsideForce: View {
    @Binding var screenIndex: Int
    @State private var hasAnswer1 = false
    @State private var hasAnswer2 = false
    
    var body: some View {
        Text("Do you believe an outside force may know you better than you know yourself?")
            .multilineTextAlignment(.center)
            .font(.custom(Fonts.ZCOOL.rawValue, size: 24))
            .foregroundColor(Color(Colors.Gold.rawValue))
            .padding(20)
        Form {
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

struct Screen05InterfaceWithMedium: View {
    @Binding var screenIndex: Int
    
    var body: some View {
        VStack {
            Text("""
                Thank you for helping the machine medium compile data.
                
                In order to best recreate the organic medium experience we will need one volunteer from the group to interface with the machine medium. Please choose a participant with a high level of trust to proceed to the interface screen.
                """)
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
                screenIndex = 8
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

struct Screen06ProceedInterfaceMedium: View {
    @Binding var screenIndex: Int
    
    var body: some View {
        VStack {
            Text("""
                Please proceed to the machine medium's interface to connect to the psychic network and receive your materialization.
                
                For your own safety proceed only if no other humans are in the vicinity.
                """)
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


struct Screen07MeetMachine: View {
    @Binding var screenIndex: Int
    @State private var counter = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("""
                When you are ready to meet the machine medium please introduce yourself by speaking into the machine eye above the interface screen.

                The machine medium will guide you.

                Thank you.
                """)
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

struct Screen08HaveRecorded: View {
    @Binding var screenIndex: Int
    
    var body: some View {
        VStack {
            Text("""
                Welcome Back.

                We thank you for the important vocal organic data. We have recorded and stored it in our database for future use.
                
                For the full materialization experience we must collect a mixture of organic and machine data from you.
                
                Please interface with the organic medium through the windows.
                """)
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

struct Screen09FinalMaterialization: View {
    @Binding var installIndex: Int
    var numInstallsAtSite: Int
    var body: some View {
        VStack {
            Text("""
                All phases of materialization are complete.
                
                Thank you for adding to the machine mediums' data collection.
                
                Please follow the arrows to the next installation
                """)
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

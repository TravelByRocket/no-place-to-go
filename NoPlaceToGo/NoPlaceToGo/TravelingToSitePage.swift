//
//  SiteTransition.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 10/3/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI
import AVFoundation

struct TravelingToSitePage: View {
    @EnvironmentObject private var pm: ProgressManager
    @EnvironmentObject private var am: AudioManager
    @State private var showingAlert = false
    @State private var narrativeFinished = false
    @State private var showClownAlert = false
    @State private var showSpyPhoto = false
    @State private var pausedManually = false
    @State private var gotDirections = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Next Location Revealed!")
                .multilineTextAlignment(.center)
                .font(.custom(fonts.ZCOOL, size: 26))
                .foregroundColor(Color("Gold"))
            Text(addressedSites.siteObjectFromSiteEnum(site: pm.curSite!).name)
                .font(.custom(fonts.Notable, size: 26))
                .foregroundColor(Color("PinkHeadings"))
                .multilineTextAlignment(.center)
            Group {
                Text(addressedSites.siteObjectFromSiteEnum(site: pm.curSite!).address)
                    .multilineTextAlignment(.center)
                    .font(.caption)
                if pm.curSite == .MusicRange {
                    Text("Warning: Data Assimilation Base contains light nudity. In order to keep NP2G pandemic-safe, if you choose to skip this installation please remain in your car for 8 minutes before moving on to The Overwhelm.")
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            .padding([.horizontal,.bottom])
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    if pausedManually {
                        am.play()
                        gotDirections = false
                    } else {
                        am.pause()
                    }
                    pausedManually.toggle()
                }) {
                    Image(systemName: pausedManually ? "play" : "pause")
                        .font(.custom(fonts.ZCOOL, size: 24))
                        .foregroundColor(Color(Colors.Gold.rawValue))
                        .padding()
                        .frame(width: 65)
                }
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1))
                Spacer()
                Button(action: {
                    addressedSites.siteObjectFromSiteEnum(site: pm.curSite!).getDirections()
                    am.pause()
                    pausedManually = true
                    gotDirections = true
                }) {
                    Text("Get Directions")
                        .font(.custom(fonts.ZCOOL, size: 24))
                        .foregroundColor(Color(Colors.Gold.rawValue))
                        .padding()
                }
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1))
                Spacer()
            }
            
            Spacer()
            Button(action: {
                self.showingAlert = true
            }) {
                Text(addressedSites.siteObjectFromSiteEnum(site: pm.curSite!).arrivalConfirmationMessage)
                    .multilineTextAlignment(.center)
                    .font(.custom(fonts.ZCOOL, size: 24))
                    .foregroundColor(Color(Colors.Gold.rawValue))
                    .padding()
            }
//            .opacity(narrativeFinished ? 1.0 : 0.3)
//            .disabled(!narrativeFinished)
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1))
            .sheet(isPresented: $showClownAlert, content: {
                ClownPopup()
            })
            .sheet(isPresented: $showSpyPhoto, content: {
                PhotoSurprise()
                    .environmentObject(pm)
            })
            .onReceive(timer, perform: { _ in
                
                if let playing = am.audioPlayer?.isPlaying {
                    if (!playing && !pausedManually && !gotDirections &&
                            (am.audioPlayer?.currentTime == am.audioPlayer?.duration || (am.audioPlayer?.currentTime == 0))) {
                        am.load(filename: addressedSites.siteObjectFromSiteEnum(site: pm.curSite!).loopingAudioFilename, loop: true)
                        am.play()
                    } else if (playing && !pm.hasShownSpyPhoto && !showSpyPhoto) {
                        if let phototime = pm.photoDate {
                            if (Date().timeIntervalSince(phototime) > 20 * 60) {
                                showSpyPhoto = true
                                pm.hasShownSpyPhoto = true
                            }
                        }
                    } else if (!playing && !pausedManually && !AVAudioSession.sharedInstance().isOtherAudioPlaying) {
                        am.play()
                    }
                }
            })
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text("Are you at the entrance to the installation at this location? Once you proceed you will not be able to go back."),
                    primaryButton: .cancel(),
                    secondaryButton: .default(
                        Text("Proceed"),
                        action: {
                            pm.inTransitToSite = false
                        }
                    )
                )
            }
            Spacer()
            
            StyledMap()
                .onLongPressGesture(minimumDuration: 2) {
                    pm.inTransitToSite = false
                }
                .onAppear{
                    am.load(filename: addressedSites.siteObjectFromSiteEnum(site: pm.curSite!).narrativeAudioFilename, loop: false)
                    am.play()
                }
                .onDisappear{
                    am.stop()
                }
        }
    }
}

struct SiteTransition_Previews: PreviewProvider {
    static var previews: some View {
        TravelingToSitePage()
    }
}

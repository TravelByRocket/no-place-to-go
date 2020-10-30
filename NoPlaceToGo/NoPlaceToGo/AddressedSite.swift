//
//  AddressedSite.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//

import SwiftUI

struct addressedSites {
    let name: String
    let address: String
    let arrivalConfirmationMessage: String
    let arrivalClownAudio: String?
    let departureConfirmationMessage: String
    static let finalDepartureConfirmationMessage: String = "I am in my car and ready to go No Place!"
    let narrativeAudioFilename: String
    let loopingAudioFilename: String
    var addressSearchableString: String {
        address.replacingOccurrences(of: " ", with: "+")
    }
    
    static let mintSerif: addressedSites = addressedSites(
        name: "The Overwhelm",
        address: "7310 W Colfax Ave, Lakewood, CO 80214",
        arrivalConfirmationMessage: "I have arrived at\nThe Overwhelm\nand am on the back\npatio of the\nclown's house",
        arrivalClownAudio: nil,
//        arrivalClownAudio: "NP2G3_b1.mp3",
        departureConfirmationMessage: "I am in my car and ready to go to Liberace's Dream!",
        narrativeAudioFilename: "mintseriffull.mp3",
        loopingAudioFilename: "reflections.mp3")
    
    static let lamarA: addressedSites = addressedSites(
        name: "The Surveillance Spa",
        address: "6451 W Colfax Ave, Lakewood, CO 80214",
        arrivalConfirmationMessage: "I have arrived at\nThe Surveillance Spa",
        arrivalClownAudio: nil,
//        arrivalClownAudio: "NP2G3_b2.mp3",
        departureConfirmationMessage: "I am in my car and ready to go to The Waiting Room!",
        narrativeAudioFilename: "lamarafull.mp3",
        loopingAudioFilename: "jauntyvampire.mp3")
    
    static let lamarB: addressedSites = addressedSites(
        name: "A Liberaci Dream",
        address: "6579 W Colfax Ave, Lakewood, CO 80214",
        arrivalConfirmationMessage: "I have arrived at\nA Liberaci Dream",
        arrivalClownAudio: nil,
//        arrivalClownAudio: "NP2G3_b3.mp3",
        departureConfirmationMessage: "I have exited Liberace's Dream and am ready to walk to The Surveillance Spa!",
        narrativeAudioFilename: "lamarbcut.mp3",
        loopingAudioFilename: "jauntyvampire.mp3")
    
    static let tootsies: addressedSites = addressedSites(
        name: "The Waiting Room",
        address: "6985 W 38th Ave, Wheat Ridge, CO 80033",
        arrivalConfirmationMessage: "I have arrived at\nThe Waiting Room\nand I am waiting inside",
        arrivalClownAudio: nil,
//        arrivalClownAudio: "NP2G3_b4.mp3",
        departureConfirmationMessage: "I am in my car and ready to go to Data Assimilation Base!",
        narrativeAudioFilename: "tootsiesfullmix.mp3",
        loopingAudioFilename: "tootsiesfullmix.mp3")
    
    static let musicRange: addressedSites = addressedSites(
        name: "Data Assimilation Base",
        address: "1520 Iris St, Lakewood, CO 80215",
        arrivalConfirmationMessage: "I have arrived at\nData Assimilation Base",
        arrivalClownAudio: nil,
//        arrivalClownAudio: "NP2G3_b5.mp3",
        departureConfirmationMessage: "I am in my car and ready to go to The Overwhelm!",
        narrativeAudioFilename: "musicrangefull.mp3",
        loopingAudioFilename: "reflections.mp3")
    
    static let mintSerifFinal: addressedSites = addressedSites(
        name: "No Place",
        address: "7310 W Colfax Ave, Lakewood, CO 80214",
        arrivalConfirmationMessage: "I have arrived at\nNo Place",
        arrivalClownAudio: nil,
        departureConfirmationMessage: "this content is not used",
        narrativeAudioFilename: "mintseriffinal.mp3",
        loopingAudioFilename: "jauntyvampire.mp3")
    
    static func siteObjectFromSiteEnum(site: Sites) -> addressedSites {
        switch site {
        case .MintSerif:
            return addressedSites.mintSerif
        case .LamarA:
            return addressedSites.lamarA
        case .LamarB:
            return addressedSites.lamarB
        case .Tootsies:
            return addressedSites.tootsies
        case .MusicRange:
            return addressedSites.musicRange
        case .MintSerifFinal:
            return addressedSites.mintSerifFinal
        }
    }
    
    func getDirections() {
//        let preferGoogle: Bool = UserDefaults.standard.bool(forKey: "preferGoogle")
        UIApplication.shared.open(URL(string:"https://maps.google.com/?daddr=\(self.addressSearchableString)")!)
//            "https://maps.\(preferGoogle ? "google" : "apple").com/?daddr=\(self.addressSearchableString)"
    }
}

//
//  AddressedSite.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//

import SwiftUI

struct Location {
    let name: String
    let address: String
    let arrivalConfirmationMessage: String
    let departureConfirmationMessage: String
    static let finalDepartureConfirmationMessage: String = "I am in my car and ready to go No Place!"
    let narrativeAudioFilename: String
    let loopingAudioFilename: String
    var addressSearchableString: String {
        address.replacingOccurrences(of: " ", with: "+")
    }

    static let mintSerif: Location = Location(
        name: "The Overwhelm",
        address: "7310 W Colfax Ave, Lakewood, CO 80214",
        arrivalConfirmationMessage: "I have arrived at\nThe Overwhelm\nand am on the back\npatio of the\nclown's house",
        departureConfirmationMessage: "I am in my car and ready to go to Liberace's Dream!",
        narrativeAudioFilename: "mintseriffull.mp3",
        loopingAudioFilename: "reflections.mp3")

    static let lamarA: Location = Location(
        name: "The Surveillance Spa",
        address: "6451 W Colfax Ave, Lakewood, CO 80214",
        arrivalConfirmationMessage: "I have arrived at\nThe Surveillance Spa",
        departureConfirmationMessage: "I am in my car and ready to go to The Waiting Room!",
        narrativeAudioFilename: "lamarafull.mp3",
        loopingAudioFilename: "jauntyvampire.mp3")

    static let lamarB: Location = Location(
        name: "A Liberace Dream",
        address: "6579 W Colfax Ave, Lakewood, CO 80214",
        arrivalConfirmationMessage: "I have arrived at\nA Liberace Dream",
        departureConfirmationMessage: "I have exited Liberace's Dream and am ready to walk to The Surveillance Spa!",
        narrativeAudioFilename: "lamarbcut.mp3",
        loopingAudioFilename: "jauntyvampire.mp3")

    static let tootsies: Location = Location(
        name: "The Waiting Room",
        address: "6985 W 38th Ave, Wheat Ridge, CO 80033",
        arrivalConfirmationMessage: "I have arrived at\nThe Waiting Room\nand I am waiting inside",
        departureConfirmationMessage: "I am in my car and ready to go to Data Assimilation Base!",
        narrativeAudioFilename: "tootsiesfullmix.mp3",
        loopingAudioFilename: "tootsiesfullmix.mp3")

    static let musicRange: Location = Location(
        name: "Data Assimilation Base",
        address: "1520 Iris St, Lakewood, CO 80215",
        arrivalConfirmationMessage: "I have arrived at\nData Assimilation Base",
        departureConfirmationMessage: "I am in my car and ready to go to The Overwhelm!",
        narrativeAudioFilename: "musicrangefull.mp3",
        loopingAudioFilename: "reflections.mp3")

    static let mintSerifFinal: Location = Location(
        name: "No Place",
        address: "7310 W Colfax Ave, Lakewood, CO 80214",
        arrivalConfirmationMessage: "I have arrived at\nNo Place",
        departureConfirmationMessage: "this content is not used",
        narrativeAudioFilename: "mintseriffinal.mp3",
        loopingAudioFilename: "jauntyvampire.mp3")

    static func siteObjectFromSiteEnum(site: Sites) -> Location {
        switch site {
        case .MintSerif:
            return Location.mintSerif
        case .LamarA:
            return Location.lamarA
        case .LamarB:
            return Location.lamarB
        case .Tootsies:
            return Location.tootsies
        case .MusicRange:
            return Location.musicRange
        case .MintSerifFinal:
            return Location.mintSerifFinal
        }
    }

    func getDirections() {
        UIApplication.shared.open(
            URL(string: "https://maps.google.com/?daddr=\(self.addressSearchableString)")!)
    }
}

//
//  AddressedSite.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//

import SwiftUI

class AddressedSite {
    let name: String
    let addressSearchableString: String
    let artists: [Artists]
    let nextLocation: Sites
    
    init(name: String, address: String, artists: [Artists], next: Sites) {
        self.name = name
        self.addressSearchableString = address.replacingOccurrences(of: " ", with: "+")
        self.artists = artists
        self.nextLocation = next
    }
    
    // These used to be computed properties but now just constant
    // setting `next` to the others directly caused compilation problems
    static var mintSerif: AddressedSite = AddressedSite(
        name: "Mint & Serif",
        address: "7310 W Colfax Ave, Lakewood, CO 80214",
        artists: [.MoeGram, .HayleyK],
        next: Sites.LamarA)
    
    static var lamarA: AddressedSite = AddressedSite(
        name: "Lamar A",
        address: "6451 W Colfax Ave, Lakewood, CO 80214",
        artists: [.StevenFrost, .Chrissy_Grace, .Thomas_Koko_Chris],
        next: Sites.LamarB)
    
    static var lamarB: AddressedSite = AddressedSite(
        name: "Lamar B",
        address: "6579 W Colfax Ave, Lakewood, CO 80214",
        artists: [.NicoleBanowetz, .Nolan],
        next: Sites.Tootsies)
    
    static var tootsies: AddressedSite = AddressedSite(
        name: "Tootsies",
        address: "6985 W 38th Ave, Wheat Ridge, CO 80033",
        artists: [.Renee_HayleyD],
        next: Sites.MusicRange)
    
    static var musicRange: AddressedSite = AddressedSite(
        name: "Music Range",
        address: "1520 Iris St, Lakewood, CO 80215",
        artists: [.Emily_Michaela],
        next: Sites.MintSerif)
    
    static func siteObjectFromSiteEnum(site: Sites) -> AddressedSite {
        switch site {
        case .MintSerif:
            return AddressedSite.mintSerif
        case .LamarA:
            return AddressedSite.lamarA
        case .LamarB:
            return AddressedSite.lamarB
        case .Tootsies:
            return AddressedSite.tootsies
        case .MusicRange:
            return AddressedSite.musicRange
        }
    }
    
    func getDirections() {
        let preferGoogle: Bool = UserDefaults.standard.bool(forKey: "preferGoogle")
        UIApplication.shared.open(URL(string:
            "https://maps.\(preferGoogle ? "google" : "apple").com/?daddr=\(self.addressSearchableString)"
            )!)
    }
}

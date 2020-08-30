//
//  AddressedSite.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//

import SwiftUI

class AddressedSite {
    let addressSearchableString: String
    let artists: [Artists]
    let nextLocation: Sites
    
    init(address: String, artists: [Artists], next: Sites) {
        self.addressSearchableString = address.replacingOccurrences(of: " ", with: "+")
        self.artists = artists
        self.nextLocation = next
    }
    
    // These used to be computed properties but now just constant
    // setting `next` to the others directly caused compilation problems
    static var mintSerif: AddressedSite = AddressedSite(
        address: "7310 W Colfax Ave, Lakewood, CO 80214",
        artists: [.MoeGram, .HayleyK],
        next: Sites.LamarA)
    
    static var lamarA: AddressedSite = AddressedSite(
        address: "6451 W Colfax Ave, Lakewood, CO 80214",
        artists: [.StevenFrost, .Chrissy_Grace, .Thomas_Koko_Chris],
        next: Sites.LamarB)
    
    static var lamarB: AddressedSite = AddressedSite(
        address: "6579 W Colfax Ave, Lakewood, CO 80214",
        artists: [.NicoleBanowetz, .Nolan],
        next: Sites.Tootsies)
    
    static var tootsies: AddressedSite = AddressedSite(
        address: "6985 W 38th Ave, Wheat Ridge, CO 80033",
        artists: [.Renee_HayleyD],
        next: Sites.MusicRange)
    
    static var musicRange: AddressedSite = AddressedSite(
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
        UIApplication.shared.open(URL(string: "https://maps.google.com/?daddr=\(self.addressSearchableString)")!) // TODO use preferred map provider
    }
}

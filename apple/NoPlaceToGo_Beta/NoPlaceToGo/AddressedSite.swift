//
//  AddressedSite.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//

import Foundation

class AddressedSite {
    let addressSearchableString: String
    let artists: [Artists]
    let nextLocation: AddressedSite
    
    init(address: String, artists: [Artists], next: AddressedSite) {
        self.addressSearchableString = address.replacingOccurrences(of: " ", with: "+")
        self.artists = artists
        self.nextLocation = next
    }
    
    static var mintSerif: AddressedSite {
        return AddressedSite(
            address: "7310 W Colfax Ave, Lakewood, CO 80214",
            artists: [.MoeGram, .HayleyK],
            next: AddressedSite.lamarA)
    }
    
    static var lamarA: AddressedSite {
        return AddressedSite(
            address: "6451 W Colfax Ave, Lakewood, CO 80214",
            artists: [.StevenFrost, .Chrissy_Grace, .Thomas_Koko_Chris],
            next: AddressedSite.lamarB)
    }
    
    static var lamarB: AddressedSite {
        return AddressedSite(
            address: "6579 W Colfax Ave, Lakewood, CO 80214",
            artists: [.NicoleBanowetz, .Nolan],
            next: AddressedSite.tootsies)
    }
    
    static var tootsies: AddressedSite {
        return AddressedSite(
            address: "6985 W 38th Ave, Wheat Ridge, CO 80033",
            artists: [.Renee_HayleyD], next: AddressedSite.musicRange)
    }
    
    static var musicRange: AddressedSite {
        return AddressedSite(
            address: "1520 Iris St, Lakewood, CO 80215",
            artists: [.Emily_Michaela],
            next: AddressedSite.mintSerif)
    }
}

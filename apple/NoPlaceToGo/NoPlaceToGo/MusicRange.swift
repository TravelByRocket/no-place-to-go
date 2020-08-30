//
//  MusicRange.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import Foundation

struct MusicRange: SingleAddressSite {
    var addressSearchableString: String = "1520 Iris St, Lakewood, CO 80215".replacingOccurrences(of: " ", with: "+")
    var artists: [Artists] = [.Emily_Michaela]
    var nextLocation: Sites = .MintSerif
}

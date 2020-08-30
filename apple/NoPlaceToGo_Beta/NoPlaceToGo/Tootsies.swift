//
//  Tootsies.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import Foundation

struct Tootsies: SingleAddressSite {
    var addressSearchableString: String = "6985 W 38th Ave, Wheat Ridge, CO 80033".replacingOccurrences(of: " ", with: "+")
    var artists: [Artists] = [.Renee_HayleyD]
    var nextLocation: Sites = .MusicRange
}

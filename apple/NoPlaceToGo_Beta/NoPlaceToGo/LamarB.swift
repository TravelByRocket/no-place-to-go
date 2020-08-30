//
//  LamarB.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import Foundation

struct LamarB: SingleAddressSite {
    var addressSearchableString: String = "6579 W Colfax Ave, Lakewood, CO 80214".replacingOccurrences(of: " ", with: "+")
    var artists: [Artists] = [.NicoleBanowetz, .Nolan]
    var nextLocation: Sites = .Tootsies
}

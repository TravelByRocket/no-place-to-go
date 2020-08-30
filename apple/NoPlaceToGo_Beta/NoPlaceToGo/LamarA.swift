//
//  LamarA.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import Foundation

struct LamarA: SingleAddressSite {
    var addressSearchableString: String = "6451 W Colfax Ave, Lakewood, CO 80214".replacingOccurrences(of: " ", with: "+")
    var artists: [Artists] = [.StevenFrost, .Chrissy_Grace, .Thomas_Koko_Chris]
    var nextLocation: Sites = .LamarB
}

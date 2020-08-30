//
//  SingleAddressSite.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import Foundation

protocol SingleAddressSite {
    var addressSearchableString: String {get}
    var artists: [Artists] {get}
    var nextLocation: Sites {get}
}

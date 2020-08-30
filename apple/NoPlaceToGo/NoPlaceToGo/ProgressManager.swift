//
//  ProgressManager.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

class ProgressManager: ObservableObject {
    @Published private(set) var curSite: Sites? = nil

    func setLocation(to site: Sites?) {
        curSite = site
    }
    
    static func getDirections(lat: Float, lon: Float) {
        UIApplication.shared.open(URL(string: "https://maps.google.com/?daddr=@\(lat),\(lon)")!) // TODO use preferred map provider
    }
    
    static func getDirections(to loc: String) {
        UIApplication.shared.open(URL(string: "https://maps.google.com/?daddr=\(loc)")!) // TODO use preferred map provider
    }
    
}

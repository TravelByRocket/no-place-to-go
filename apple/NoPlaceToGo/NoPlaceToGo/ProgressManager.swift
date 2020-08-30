//
//  ProgressManager.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

class ProgressManager: ObservableObject { // should be singleton
    @Published private(set) var curPage: DisplayPages = .home
    @Published private(set) var curSite: Sites = .MintSerif
    
    func setCurrentPage(to page: DisplayPages) {
        curPage = page
    }

    func setLocation(to site: Sites) {
        curSite = site
    }
    
    func getDirections(lat: Float, lon: Float) {
        UIApplication.shared.open(URL(string: "https://maps.google.com/?daddr=@\(lat),\(lon)")!) // TODO use preferred map provider
    }
    
    func getDirections(to loc: String) {
        UIApplication.shared.open(URL(string: "https://maps.google.com/?daddr=\(loc)")!) // TODO use preferred map provider
    }
    
}

enum DisplayPages {
    case home
    case settings
    case artists
    case about
    case experience
}

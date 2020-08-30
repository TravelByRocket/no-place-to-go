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
    
}

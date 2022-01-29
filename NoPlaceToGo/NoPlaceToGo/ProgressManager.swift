//
//  ProgressManager.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

class ProgressManager: ObservableObject {
    @Published private(set) var curSite: Sites?
    @Published var inTransitToSite = true

    var carGroup: CarGroup!
    var date: Date?
    var photoDate: Date?
    var hasShownSpyPhoto = false

    @Published var completions = Completions()

    func setLocation(to site: Sites?) {
        curSite = site
    }

    func nextSite(from site: Sites) -> Sites? {
        if completions.hasCompletedAllSites {
            return .MintSerifFinal
        } else {
            switch site {
            case .LamarB:
                return .LamarA
            case .LamarA:
                return .Tootsies
            case .Tootsies:
                return .MusicRange
            case .MusicRange:
                return .MintSerif
            case .MintSerif:
                return .LamarB
            case .MintSerifFinal:
                return nil
            }
        }
    }

    struct Completions {
        var lamarb = false
        var lamara = false
        var tootsies = false
        var musicrange = false
        var mintserif = false
        var mintseriffinal = false

        var hasCompletedAllSites: Bool {
            musicrange && tootsies && lamara && lamarb && mintserif
        }
    }
}

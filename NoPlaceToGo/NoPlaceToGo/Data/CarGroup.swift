//
//  CarGroup.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 21 Jan 2022.
//  Copyright © 2022 Bryan Costanza. All rights reserved.
//

import Foundation

struct CarGroup {
    let startingLocation: Sites
    let groupLetter: Character
    let groupNumber: Int

    init(_ startingLocation: Sites, _ groupLetter: Character, _ groupNumber: Int) {
        self.startingLocation = startingLocation
        self.groupLetter = groupLetter
        self.groupNumber = groupNumber
    }

    var asString: String {
        return String(groupLetter) + String(groupNumber)
    }

    static let a1 = CarGroup(.LamarB,"a",1)
    static let a2 = CarGroup(.LamarA,"a",2)
    static let a3 = CarGroup(.Tootsies,"a",3)
    static let a4 = CarGroup(.MusicRange,"a",4)
    static let b1 = CarGroup(.LamarB,"b",1)
    static let b2 = CarGroup(.LamarA,"b",2)
    static let b3 = CarGroup(.Tootsies,"b",3)
    static let b4 = CarGroup(.MusicRange,"b",4)
    static let c1 = CarGroup(.LamarB,"c",1)
    static let c2 = CarGroup(.LamarA,"c",2)
    static let c3 = CarGroup(.Tootsies,"c",3)
    static let c4 = CarGroup(.MusicRange,"c",4)
    static let d1 = CarGroup(.LamarB,"d",1)
    static let d2 = CarGroup(.LamarA,"d",2)
    static let d3 = CarGroup(.Tootsies,"d",3)
    static let d4 = CarGroup(.MusicRange,"d",4)
    static let e1 = CarGroup(.LamarB,"e",1)
    static let e2 = CarGroup(.LamarA,"e",2)
    static let e3 = CarGroup(.Tootsies,"e",3)
    static let e4 = CarGroup(.MusicRange,"e",4)
    static let f1 = CarGroup(.LamarB,"f",1)
    static let f2 = CarGroup(.LamarA,"f",2)
    static let f3 = CarGroup(.Tootsies,"f",3)
    static let f4 = CarGroup(.MusicRange,"f",4)
}

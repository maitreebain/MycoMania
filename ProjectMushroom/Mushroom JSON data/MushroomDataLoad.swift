//
//  MushroomDataLoad.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 12/6/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct MushroomDataLoad: Decodable {
    let latin: String
    let common: [String]
    let regions: [String]
    let habitat: String
    let fairyRings: Bool
    let attributes: ShroomAttributes
}


struct ShroomAttributes: Decodable {
    let psychoactive: Bool
    let poisonous: Bool
    let deadly: Bool
    let ecology: [String]
}


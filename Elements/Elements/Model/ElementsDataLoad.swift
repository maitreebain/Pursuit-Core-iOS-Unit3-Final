//
//  ElementsDataLoad.swift
//  Elements
//
//  Created by Maitree Bain on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ElementsDataLoad: Codable {
    let name: String
    let atomic_mass: Double?
    let symbol: String
    var number: Int
    let melt: Double?
    let molar_heat: Double?
    let discovered_by: String?
}

//fix coding keys later

//private enum CodingKeys: String, CodingKey {
//    case name
//    case atomicMass = "atomic_mass"
//    case symbol
//    case number
//    case melt
//    case boilingPoint = "molar_heat"
//    case discoveredBy = "discovered_by"
//
//}

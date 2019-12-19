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
    let atomicMass: Double?
    let symbol: String
    let number: Int
    let melt: Double?
    let boilingPoint: Double?
    let discoveredBy: String?
}

private enum CodingKeys: String, CodingKey {
    case name
    case symbol
    case number
    case melt
    case atomicMass = "atomic_mass"
    case discoveredBy = "discovered_by"
    case boilingPoint = "molar_heat"
}

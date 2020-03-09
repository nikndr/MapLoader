//
//  Country.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 08.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import Foundation

struct MapRegion {
    let name: String
    let parentRegionName: String?
    let subregions: [MapRegion]?
    let continentName = "europe"
    var isMapDownloaded: Bool = false
    
    var displayName: String {
        name.capitalized
    }
    
    var mapFileName: String {
        let fileSuffix = "_2.obf.zip"
        if let parentName = parentRegionName {
            return "\(parentName.capitalized)_\(name)_\(continentName)\(fileSuffix)"
        } else {
            return "\(name.capitalized)_\(continentName)\(fileSuffix)"
        }
    }
}

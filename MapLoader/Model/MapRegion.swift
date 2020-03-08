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
    let subregions: [MapRegion]?
    var isMapDownloaded: Bool
}

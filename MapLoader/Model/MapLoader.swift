//
//  MapLoader.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 08.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import Foundation

struct MapLoader {
    static let regions: [MapRegion] = [MapRegion(name: "Albania", parentRegionName: nil, subregions: nil, isMapDownloaded: false),
                                MapRegion(name: "Andora", parentRegionName: nil, subregions: nil, isMapDownloaded: false),
                                MapRegion(name: "Austria", parentRegionName: nil, subregions: nil, isMapDownloaded: false),
                                MapRegion(name: "Azores", parentRegionName: nil, subregions: nil, isMapDownloaded: false),
                                MapRegion(name: "Bosnia", parentRegionName: nil, subregions: nil, isMapDownloaded: false),
                                MapRegion(name: "Bulgaria", parentRegionName: nil, subregions: nil, isMapDownloaded: false),
                                MapRegion(name: "France", parentRegionName: nil, subregions: nil, isMapDownloaded: false),
                                MapRegion(name: "Germany", parentRegionName: nil, subregions:
                                    [MapRegion(name: "Bavaria", parentRegionName: "Germany", subregions: nil, isMapDownloaded: false), MapRegion(name: "Hamburg", parentRegionName: "Germany", subregions: nil, isMapDownloaded: false), MapRegion(name: "Berlin", parentRegionName: "Germany", subregions: nil, isMapDownloaded: true)], isMapDownloaded: false)]
}

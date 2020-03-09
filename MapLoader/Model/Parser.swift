//
//  Parser.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 09.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import Foundation

// if map is not specified, then map="yes"
// if type="map", then map="yes"
// if map="no" and outer region (indent == 1), then it should have inner regions
// if map="no" and inner region (indent > 1), then skip

class Parser: NSObject, XMLParserDelegate {
    private var currentElement = ""
    private var currentRegionName: String = "" {
        didSet {
            currentRegionName = currentRegionName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentType: String = "" {
        didSet {
            currentType = currentType.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentMap: String = "" {
        didSet {
            currentMap = currentMap.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    private var currentIndent: Int = 0
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        if currentElement == "region", elementName == "region" {
            currentIndent += 1
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {}
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {}
}


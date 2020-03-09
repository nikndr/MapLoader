//
//  Utils.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 08.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import UIKit

extension UIDevice {
    // MARK: - Get raw value

    var totalDiskSpaceInBytes: Int64 {
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
            let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
    }

    var freeDiskSpaceInBytes: Int64 {
        if #available(iOS 11.0, *) {
            let space = try? URL(fileURLWithPath: NSHomeDirectory() as String)
                .resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey])
                .volumeAvailableCapacityForImportantUsage
            return space ?? 0
        } else {
            if let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
                let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value {
                return freeSpace
            } else {
                return 0
            }
        }
    }

    var usedDiskSpaceInBytes: Int64 {
        return totalDiskSpaceInBytes - freeDiskSpaceInBytes
    }

    // MARK: - String Value

    var totalDiskSpaceInGB: String {
        return ByteCountFormatter.string(fromByteCount: totalDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }

    var freeDiskSpaceInGB: String {
        return ByteCountFormatter.string(fromByteCount: freeDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }

    var usedDiskSpaceInGB: String {
        return ByteCountFormatter.string(fromByteCount: usedDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }
}

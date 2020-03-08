//
//  Constants.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 08.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import UIKit

struct CellIdentifiers {
    static let downloadCell = "DownloadCell"
    static let nextScreenCell = "NextScreenCell"
}

struct SegueIdentifiers {
    static let countrySegue = "countrySegue"
}

struct CellNibs {
    static let downloadCellNib = "DownloadMapTableViewCell"
    static let nextScreenCellNib = "NextScreenTableViewCell"
}

struct ConstraintConstants {
    struct DownloadCell {
        static let regionLabelTopDefault: CGFloat = 6.0
        static let regionLabelTopBarHidden: CGFloat = 11.0
        static let progressBarBottomDefault: CGFloat = 12.0
        static let progressBarBottomBarHidden: CGFloat = 5
    }
}



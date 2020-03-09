//
//  UIRoundedProgressView.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 09.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import UIKit

class UIRoundedProgressView: UIProgressView {
    override func layoutSubviews() {
        super.layoutSubviews()
        subviews.forEach { subview in
            subview.layer.masksToBounds = true
            subview.layer.cornerRadius = bounds.height / 2
        }
    }
}

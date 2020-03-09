//
//  NextScreenTableViewCell.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 08.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import UIKit

class NextScreenTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var regionNameLabel: UILabel!
    
    // MARK: - Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

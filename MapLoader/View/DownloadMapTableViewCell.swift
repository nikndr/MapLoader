//
//  RegionTableViewCell.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 08.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import UIKit

class DownloadMapTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    var shouldShowProgressBar: Bool = true
    
    // MARK: - Outlets
    
    @IBOutlet var regionNameLabel: UILabel!
    @IBOutlet var downloadButton: UIButton!
    @IBOutlet var progressBarView: UIView!
    @IBOutlet var regionNameTopConstraint: NSLayoutConstraint!
    @IBOutlet var progressBarBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Actions
    
    @IBAction func downloadButtonPressed(_ sender: UIButton) {
        let animationDuration = 0.3
        if shouldShowProgressBar {
            UIView.transition(with: self, duration: animationDuration, options: [.curveEaseInOut], animations: { [weak self] in
                self?.progressBarShownSettings()
            }, completion: nil)
            
        } else {
            UIView.transition(with: self, duration: animationDuration, options: [.curveEaseInOut], animations: { [weak self] in
                self?.progressBarHiddenSettings()
            }, completion: nil)
        }
        shouldShowProgressBar.toggle()
    }
    
    // MARK: - Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - UI configuration
    
    func configureUI() {
        progressBarView.layer.cornerRadius = progressBarView.bounds.height / 2
        progressBarHiddenSettings()
    }
    
    func progressBarHiddenSettings() {
        progressBarView.isHidden = true
        progressBarBottomConstraint.constant = ConstraintConstants.DownloadCell.progressBarBottomBarHidden
        regionNameTopConstraint.constant = ConstraintConstants.DownloadCell.regionLabelTopBarHidden
        layoutIfNeeded()
    }
    
    func progressBarShownSettings() {
        progressBarView.isHidden = false
        progressBarBottomConstraint.constant = ConstraintConstants.DownloadCell.progressBarBottomDefault
        regionNameTopConstraint.constant = ConstraintConstants.DownloadCell.regionLabelTopDefault
        layoutIfNeeded()
    }
}

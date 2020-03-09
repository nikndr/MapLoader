//
//  CountryTableViewController.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 08.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {
    // MARK: - Properties
    
    var mapLoader: MapLoader! {
        didSet {
            updateViewFromModel()
        }
    }
    
    var selectedIndex: Int!
    
    // MARK: - Outlets
    
    @IBOutlet var freeStorageLabel: UILabel!
    @IBOutlet weak var storageBarView: UIRoundedProgressView!
        
    // MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapLoader = MapLoader()
        configureUI()
        registerTableViewCells()
        
        print(UIDevice.current.totalDiskSpaceInGB)
        print(UIDevice.current.freeDiskSpaceInGB)
    }
    
    func registerTableViewCells() {
        let downloadCellNibName = CellNibs.downloadCellNib
        let downloadTableViewCell = UINib(nibName: downloadCellNibName, bundle: nil)
        let downloadCellIdentifier = CellIdentifiers.downloadCell
        tableView.register(downloadTableViewCell, forCellReuseIdentifier: downloadCellIdentifier)
        
        let nextScreenNibName = CellNibs.nextScreenCellNib
        let nextScreenTableViewCell = UINib(nibName: nextScreenNibName, bundle: nil)
        let nextScreenCellIdentifier = CellIdentifiers.nextScreenCell
        tableView.register(nextScreenTableViewCell, forCellReuseIdentifier: nextScreenCellIdentifier)
    }
    
    // MARK: - UI configuration
    
    func configureUI() {
        storageBarView.layer.masksToBounds = true
        storageBarView.layer.cornerRadius = storageBarView.bounds.size.height / 2
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func updateViewFromModel() {
        freeStorageLabel.text = UIDevice.current.freeDiskSpaceInGB
        let freeSpaceRatio = Float(UIDevice.current.usedDiskSpaceInBytes) / Float(UIDevice.current.totalDiskSpaceInBytes)
        storageBarView.progress = freeSpaceRatio
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.countrySegue {
            if let destinationViewController = segue.destination as? RegionTableViewController {
                destinationViewController.region = MapLoader.regions[selectedIndex]
            }
        }
    }
}

extension CountryTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MapLoader.regions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String
        let region = MapLoader.regions[indexPath.row]
        if MapLoader.regions[indexPath.row].subregions == nil {
            identifier = CellIdentifiers.downloadCell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DownloadMapTableViewCell else {
                fatalError("tableView(cellForRowAt: \(indexPath))")
            }
            cell.regionNameLabel.text = region.name
            return cell
        } else {
            identifier = CellIdentifiers.nextScreenCell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NextScreenTableViewCell else {
                fatalError("tableView(cellForRowAt: \(indexPath)")
            }
            cell.regionNameLabel.text = region.name
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Europe"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        if MapLoader.regions[selectedIndex].subregions != nil {
            performSegue(withIdentifier: SegueIdentifiers.countrySegue, sender: self)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

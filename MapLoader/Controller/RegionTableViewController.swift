//
//  RegionTableViewController.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 08.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import UIKit

class RegionTableViewController: UITableViewController {
    // MARK: - Properties

    var region: MapRegion!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerTableViewCells()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func registerTableViewCells() {
        let downloadCellNibName = CellNibs.downloadCellNib
        let downloadTableViewCell = UINib(nibName: downloadCellNibName, bundle: nil)
        let downloadCellIdentifier = CellIdentifiers.downloadCell
        tableView.register(downloadTableViewCell, forCellReuseIdentifier: downloadCellIdentifier)
    }
    
    // MARK: - UI configuration
    func configureUI() {
        navigationItem.title = region.name
    }
}

extension RegionTableViewController {
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let subregions = region.subregions else {
            fatalError("какова хуя")
        }
        return subregions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.downloadCell, for: indexPath) as? DownloadMapTableViewCell else {
            fatalError("Could nod deque reusable cell on second screen")
        }
        guard let subregions = region.subregions else {
            fatalError("no subregions found on second screen")
        }
        cell.regionNameLabel.text = subregions[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

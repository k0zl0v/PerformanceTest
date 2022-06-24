//
//  FrameViewController.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import UIKit

class FrameViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(FrameTableViewCell.self, forCellReuseIdentifier: FrameTableViewCell.identifier)
        tableView.rowHeight = 60
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellViewModel.exampleData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FrameTableViewCell.identifier) as! FrameTableViewCell
        cell.update(with: CellViewModel.exampleData[indexPath.row])
        return cell
    }

}


//
//  MainViewController.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import UIKit
import SwiftUI

class MainViewController: UITableViewController {
    
    enum Cell: String, CaseIterable {
        case frame = "Frame"
        case autolayout = "AutoLayout"
        case swiftUI = "SwiftUI"
    }
    
    private let cellIdentifier = "MainCell"
    
    private let cells = Cell.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.textLabel?.text = cells[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch cells[indexPath.row] {
        case .frame:
            navigationController?.pushViewController(FrameViewController(), animated: true)
        case .autolayout:
            navigationController?.pushViewController(AutoLayoutViewController(), animated: true)
        case .swiftUI:
            navigationController?.pushViewController(UIHostingController(rootView: SwiftUIView()), animated: true)
        }
    }

}

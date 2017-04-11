//
//  TableViewController.swift
//  OutOfBoundsTableView
//
//  Created by mitsuyoshi.yamazaki on 2017/04/11.
//  Copyright © 2017年 mitsuyoshi.yamazaki. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  private var heights: [Int: CGFloat] = [:]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - UITableViewDataSource
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if let height = heights[indexPath.row] {
      return height
    } else {
      return 44.0
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    cell.textLabel?.text = indexPath.description
    
    let delay: DispatchTime = .now() + 0.5 + (Double(arc4random() % UInt32(10)) / 10.0)
    
    DispatchQueue.main.asyncAfter(deadline: delay) { [weak self] _ in
      self?.heights[indexPath.row] = CGFloat((indexPath.row + 1) * 44)
      tableView.reloadRows(at: [indexPath], with: .none)
    }

    return cell
  }
}

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
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    cell.textLabel?.text = indexPath.description
    
    return cell
  }
}

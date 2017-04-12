//
//  ViewController.swift
//  OutOfBoundsTableView
//
//  Created by mitsuyoshi.yamazaki on 2017/04/12.
//  Copyright © 2017年 mitsuyoshi.yamazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func clearImageCache(sender: AnyObject!) {
    SDImageCache.shared().clearMemory()
  }
}

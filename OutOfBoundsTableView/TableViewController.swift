//
//  TableViewController.swift
//  OutOfBoundsTableView
//
//  Created by mitsuyoshi.yamazaki on 2017/04/11.
//  Copyright © 2017年 mitsuyoshi.yamazaki. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  private let imagePaths = [
    "http://i.huffpost.com/gen/1410937/images/o-RAMEN-facebook.jpg",
    "http://mensho.tokyo/images/ramens_vegan.jpg",
    "https://www.chowhound.com/blog-media/2015/06/phpThumb_generated_thumbnail.jpeg",
    "http://greatist.com/sites/default/files/styles/article_main/public/SlowCooker-Pork-Ramen.jpg?itok=6l3EjToO",
    "http://www.epicurious.com/images/articlesguides/holidays/thanksgiving/ramen_612.jpg",
    "http://www.japanfestivalboston.org/ja/wp-content/uploads/2017/03/Ganko1.jpg",
  ]
  private var contents: [Int: (image: UIImage, height: CGFloat)] = [:]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - UITableViewDataSource
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return imagePaths.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if let height = contents[indexPath.row]?.height {
      return height
    } else {
      return 80.0
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
    
    if let image = contents[indexPath.row]?.image {
      cell.contentImageView.image = image
    } else {
      let path = imagePaths[indexPath.row]
      let imageURL = URL(string: path)
      
      cell.contentImageView.sd_setImage(with: imageURL, completed: { [weak self] (image, error, cacheType, url) in
        guard let this = self,
          let image = image,
          error == nil
          else {
            print("Loading image failed with error: \(error)\n\(url)")
            return
        }
        
        let height = (tableView.frame.size.width * image.size.height) / image.size.width
        this.contents[indexPath.row] = (image: image, height: height)
        
        tableView.reloadRows(at: [indexPath], with: .none)
      })
    }
    
    return cell
  }
}

class TableViewCell: UITableViewCell {
  @IBOutlet fileprivate weak var contentImageView: UIImageView!
  
//  override func awakeFromNib() {
//    super.awakeFromNib()
//    
//    contentImageView.layer.borderColor = UIColor.lightGray.cgColor
//    contentImageView.layer.borderWidth = 2.0
//  }
}

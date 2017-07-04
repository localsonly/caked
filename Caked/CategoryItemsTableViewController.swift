//
//  CategoryItemsTableViewController.swift
//  Caked
//
//  Created by Jeff Cedilla on 7/4/17.
//  Copyright © 2017 spaghetticoder. All rights reserved.
//

import UIKit

class CategoryCell:UITableViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
}

class CategoryItemsTableViewController: UITableViewController {

    var images = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        images = [UIImage(named: "cookie1"), UIImage(named: "cookie2"), UIImage(named: "cookie3")]
        
        navigationController?.navigationBar.tintColor = UIColor.CustomColor.tealHighlight
        tableView.backgroundColor = UIColor.CustomColor.blackBackground
        tableView.separatorColor = UIColor.clear
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell

        cell.categoryImageView.image = images[indexPath.row]
        
        
        return cell
    }
}

//
//  MainTableViewController.swift
//  Caked
//
//  Created by Jeff Cedilla on 7/2/17.
//  Copyright © 2017 spaghetticoder. All rights reserved.
//

import UIKit

class FoodCell:UITableViewCell {
    @IBOutlet weak var foodLabel: UILabel!
}

class MainTableViewController: UITableViewController {

    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = ["cookies", "brownies", "cakes", "cupcakes", "bars"]
        
        tableView.backgroundColor = UIColor.CustomColor.blackBackground
        tableView.separatorColor = UIColor.clear
        
        navigationController?.navigationBar.titleTextAttributes =
            [
                NSForegroundColorAttributeName: UIColor.CustomColor.tealHighlight,
                NSFontAttributeName: UIFont(name: "Savoye LET", size: 25)!
            ]
        navigationItem.title = "Caked"
        
        tableView.rowHeight = 75
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FoodCell

        // Configure the cell...
        cell.foodLabel.text = data[indexPath.row]
        
        
        return cell
    }

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 75
//    }
    

}

//
//  ViewController.swift
//  CakedMobileSwift
//
//  Created by Hieu Do on 7/2/17.
//  Copyright © 2017 Hieu Do. All rights reserved.
//

import UIKit

let itemsUrl = "https://connect.squareup.com/v1/34T664QSMKC6D/items"
let personalToken = "sq0atp-KOI6SGfEm63Dj2H7cgWtKg"
let authValue = "Bearer sq0atp-KOI6SGfEm63Dj2H7cgWtKg" // personal access token here

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet
    var tableView: UITableView!
    var items: [String] = []
    var categories: [String: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        httpGetAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func httpGetAllItems() {
        let url = URL (string: itemsUrl)
        var request = URLRequest (url: url!)
        request.addValue(authValue, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with:request) {
            (data, response, error) -> Void in
            if error != nil {
                // TODO: NO INTERNET!
            } else {
                let json = try? JSONSerialization.jsonObject(with:data!, options: [])
                // TODO: Check data nil no internet
                
                if let array = json as? [Any] {
                    for item in array {
                        if let item = item as? [String:Any] {
                            // Get Category and add
                            if let category = item["category"] as? [String:Any] {
                                let categoryName = category["name"] as! String
                                
                                // Add the category
                                if(!self.items.contains(categoryName)) {
                                    self.items.append(categoryName)
                                }
                                
                            }
                            
                            // Build an item
                        }
                    }
                }
                
                // Parsing complete
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}


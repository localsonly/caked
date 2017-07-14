//
//  Utils.swift
//  CakedMobileSwift
//
//  Created by Hieu Do on 7/5/17.
//  Copyright © 2017 Hieu Do. All rights reserved.
//

import Foundation

import Firebase

class NetworkUtils {
    
    static var ref:DatabaseReference = Database.database().reference()
    
    static func downloadCategories(to parent: MainTableViewController) {
        //ref = Database.database().reference()
        
        ref.child("Categories").queryOrderedByKey().observeSingleEvent(of: .value, with: { (snap) in
            for category in snap.children.allObjects as! [DataSnapshot] {
                parent.data.append(category.key)
            }
            
            DispatchQueue.main.async{
                parent.tableView.reloadData()
            }
        })
    }
    
    static func downloadFlavors(from category: String, to parent: CategoryItemsTableViewController) {
        // set tableview cell titles
        
        // get images!
    }
    
    
}

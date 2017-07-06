//
//  Utils.swift
//  CakedMobileSwift
//
//  Created by Hieu Do on 7/5/17.
//  Copyright © 2017 Hieu Do. All rights reserved.
//

import Foundation

import Firebase

class Utils {
    
    var ref:DatabaseReference!
    
    func downloadCategories(to array: NSMutableArray) {
        ref = Database.database().reference()
        
        ref.child("Categories").queryOrderedByKey().observeSingleEvent(of: .value, with: { (snap) in
            for category in snap.children.allObjects as! [DataSnapshot] {
                array.add(category.key)
            }
        })
    }
}

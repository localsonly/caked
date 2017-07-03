//
//  Models.swift
//  CakedMobileSwift
//
//  Created by Hieu Do on 7/2/17.
//  Copyright © 2017 Hieu Do. All rights reserved.
//

import Foundation

struct Flavor {
    var name: String
    var description: String
    var images: [NSData]
}

struct Variation {
    var name: String
    var price: Float
    var min_order: Int
}

struct Category {
    var flavor: [Flavor]
    var variations: [Variation]
}

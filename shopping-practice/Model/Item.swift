//
//  Item.swift
//  shopping-practice
//
//  Created by Yueh on 2017/11/21.
//  Copyright © 2017年 Aptan. All rights reserved.
//

import Foundation

class Items {
    static let sharedInstance = Items()
    var productArr : [Product] = [Product]()
    var name :String = ""
    var cartArr : [Cart] = [Cart]()
    var photoUrl : String!
    
}


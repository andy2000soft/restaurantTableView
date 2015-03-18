//
//  Restaurant.swift
//  Restaurant Guide
//
//  Created by Michele Cassano on 11/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import Foundation

class Restaurant {
    var name:String = ""
    var type:String = ""
    var location:String = ""
    var phone:String = ""
    var image:String = ""
    var isVisited:Bool = false
    
    init(name:String, type:String, location:String, phone:String, image:String, isVisited:Bool){
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
    }
}

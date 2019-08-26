//
//  Users.swift
//  ObserverPatternProject
//
//  Created by Youxel MacBook 8 on 8/20/19.
//  Copyright © 2019 Youxel Maged Mohammed. All rights reserved.
//

import Foundation
import ObjectMapper

struct Users: Mappable{
    
    init?(map: Map) {
        
    }
    var id:Int?
    var name:String?
    var username:String?
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        username <- map["username"]
    }
    
    
    
}

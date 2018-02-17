//
//  Service.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/24/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class Service {
    
    var title : String!
    var date : Date!
    var rooms : [Room] = [Room]()
    var counter : String!
    var location : String!
    
    init(title: String, date: Date, rooms: [Room], counter: String, location: String) {
        
        self.title = title
        self.date = date
        self.rooms = rooms
        self.counter = counter
        self.location = location
        
    }
    
    func getTotal() -> Int {
        
        var total : Int = 0
        
        for thisRoom in self.rooms {
            total += thisRoom.headCount
        }
        
        return total
        
    }
    
//    func getArrayOfTypes() -> [String] {
//
//        var arrayOfTypes = [String]()
//        var found : Bool = false
//
//        for thisRoom in self.rooms {
//
//            for thisType in arrayOfTypes {
//                if thisRoom.type == thisType {
//                    found = true
//                    break
//                }
//            }
//
//            if !found {
//                if arrayOfTypes == [] {
//                    arrayOfTypes = [thisRoom.type]
//                } else {
//                    arrayOfTypes.append(thisRoom.type)
//                }
//            }
//
//            found = false
//
//        }
//
//        return arrayOfTypes
//
//    }
    
}















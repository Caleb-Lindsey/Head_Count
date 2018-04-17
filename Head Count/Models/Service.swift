//
//  Service.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/24/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class Service : Codable {
    
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
    
    func formatForDelivery() -> String {
        var formattedService : String = ""
        let formattedDate : String = DataSource().getString(fromDate: date!)
        let greeting : String = "Here's the count for \(title!).\nCounter: \(counter!)\nLocation: \(location!)\nDate: \(formattedDate)\n\n"
        formattedService += greeting
        
        for thisRoom in self.rooms {
            
            let line : String = "     • \(thisRoom.title): \(thisRoom.headCount)\n\n"
            formattedService += line
        }
        
        let total : String = "TOTAL: \(self.getTotal())"
        formattedService += total
        
        return formattedService
        
    }
    
}















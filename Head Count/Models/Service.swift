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
    
    init(title: String, date: Date, rooms: [Room], counter: String) {
        
        self.title = title
        self.date = date
        self.rooms = rooms
        self.counter = counter
        
    }
    
}















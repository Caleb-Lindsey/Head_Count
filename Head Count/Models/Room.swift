//
//  Room.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/24/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class Room : Codable, Hashable {
    
    var title : String = ""
    var headCount : Int = 0
    public var hashValue : Int {
        return title.hashValue
    }
    
    init(title: String, headCount: Int) {
        self.title = title
        self.headCount = headCount
    }
    
    static func == (lhs: Room, rhs: Room) -> Bool {
        return lhs.title == rhs.title
    }
    
}

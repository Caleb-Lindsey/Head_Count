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
    var isSelectedForTemplate : Bool = false
    
    public var hashValue : Int {
        return title.hashValue
    }
    
    init(title: String) {
        self.title = title
    }
    
    static func == (lhs: Room, rhs: Room) -> Bool {
        return lhs.title == rhs.title
    }
}

//
//  Room.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/24/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class Room : Decodable, Encodable {
    
    var title : String = ""
    var headCount : Int = 0
    //var type : String!
    
    init(title: String, headCount: Int) {
        self.title = title
        self.headCount = headCount
    }
    
}

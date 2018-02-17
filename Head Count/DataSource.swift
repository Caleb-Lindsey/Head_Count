//
//  DataSource.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/23/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//
import UIKit

struct Global {
    
    static var arrayOfServices : [Service] = [Service]()
    static var grayColor = UIColor(red: 20/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1)
    static var offWhiteColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
    static var headerFont : UIFont = UIFont(name: "DINCondensed-Bold", size: 45)!
    
}

class DataSource {
    
    func fillMockData() {
        
        let room1 = Room(title: "Sanctuary", headCount: 439)
        let room2 = Room(title: "Lobby/Cafe", headCount: 22)
        let room3 = Room(title: "Nursery", headCount: 11)
        let room4 = Room(title: "2&3 Year-Olds", headCount: 8)
        let room5 = Room(title: "4&5 Year-Olds", headCount: 6)
        let room6 = Room(title: "Fusion", headCount: 36)
        let room7 = Room(title: "Momentum", headCount: 28)
        let room8 = Room(title: "Balcony", headCount: 9)
        let room9 = Room(title: "A/V Room", headCount: 8)
        let room10 = Room(title: "Fire Core", headCount: 6)
        
        let service1 = Service(title: "Sunday 9:30am", date: Date(), rooms: [room1, room2, room3, room4, room5, room6, room7, room8, room9, room10], counter: "Caleb Lindsey", location: "Smithfield")
        
        Global.arrayOfServices = [service1]

        let room11 = Room(title: "Sanctuary", headCount: 439)
        let room12 = Room(title: "Lobby/Cafe", headCount: 22)
        let room13 = Room(title: "Nursery", headCount: 11)
        let room14 = Room(title: "2&3 Year-Olds", headCount: 8)
        let room15 = Room(title: "4&5 Year-Olds", headCount: 6)
        let room16 = Room(title: "Fusion", headCount: 36)
        let room17 = Room(title: "Momentum", headCount: 28)
        let room18 = Room(title: "Balcony", headCount: 9)
        let room19 = Room(title: "A/V Room", headCount: 8)
        let room20 = Room(title: "Fire Core", headCount: 6)
        
        let service2 = Service(title: "Sunday 11:30am", date: Date(), rooms: [room11, room12, room13, room14, room15, room16, room17, room18, room19, room20], counter: "Fernando Medina", location: "Fall River")
        
        Global.arrayOfServices.append(service2)

    }
    
}


















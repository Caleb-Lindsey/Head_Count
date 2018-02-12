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
    static var offWhiteColor = UIColor(red: 175/255.0, green: 175/255.0, blue: 175/255.0, alpha: 1)
    
}

class DataSource {
    
    func fillMockData() {
        
        let room1 = Room(title: "Sanctuary", headCount: 439, type: "Main")
        let room2 = Room(title: "Lobby/Cafe", headCount: 22, type: "Main")
        let room3 = Room(title: "Nursery", headCount: 11, type: "NLK")
        let room4 = Room(title: "2&3 Year-Olds", headCount: 8, type: "NLK")
        let room5 = Room(title: "4&5 Year-Olds", headCount: 6, type: "NLK")
        let room6 = Room(title: "Fusion", headCount: 36, type: "NLK")
        let room7 = Room(title: "Momentum", headCount: 28, type: "NLK")
        let room8 = Room(title: "Balcony", headCount: 9, type: "Main")
        let room9 = Room(title: "A/V Room", headCount: 8, type: "Main")
        let room10 = Room(title: "Fire Core", headCount: 6, type: "Main")
        
        let service1 = Service(title: "Sunday 9:30am", date: Date(), rooms: [room1, room2, room3, room4, room5, room6, room7, room8, room9, room10], counter: "Caleb Lindsey")
        
        Global.arrayOfServices = [service1]

        let room11 = Room(title: "Sanctuary", headCount: 439, type: "Main")
        let room12 = Room(title: "Lobby/Cafe", headCount: 22, type: "Main")
        let room13 = Room(title: "Nursery", headCount: 11, type: "NLK")
        let room14 = Room(title: "2&3 Year-Olds", headCount: 8, type: "NLK")
        let room15 = Room(title: "4&5 Year-Olds", headCount: 6, type: "NLK")
        let room16 = Room(title: "Fusion", headCount: 36, type: "NLK")
        let room17 = Room(title: "Momentum", headCount: 28, type: "NLK")
        let room18 = Room(title: "Balcony", headCount: 9, type: "Main")
        let room19 = Room(title: "A/V Room", headCount: 8, type: "Main")
        let room20 = Room(title: "Fire Core", headCount: 6, type: "Main")
        
        let service2 = Service(title: "Sunday 11:30am", date: Date(), rooms: [room11, room12, room13, room14, room15, room16, room17, room18, room19, room20], counter: "Fernando Medina")
        
        Global.arrayOfServices.append(service2)

    }
    
}


















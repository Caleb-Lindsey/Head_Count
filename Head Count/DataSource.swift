//
//  DataSource.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/23/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//
import UIKit

struct Global {
    // Data
    static var arrayOfServices : [Service] = [Service]()
    static var templateRooms : Set<Room> = Set<Room>()
    static var serviceFilePath : String = "HeadCountServices.json"
    
    // Theme
    static var grayColor = UIColor(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1)
    static var blueColor = UIColor(red: 76/255.0, green: 106/255.0, blue: 255/255.0, alpha: 1)
    static var offWhiteColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
    static var headerFont : UIFont = UIFont(name: "DINCondensed-Bold", size: 45)!
}

class DataSource {
    
    func getServiceData() -> [Service] {
        
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(Global.serviceFilePath)
        
        do {
            
            let readString : String = try String(contentsOf: fileURL)
            let readStringData = readString.data(using: .utf8)
            
            var services = try JSONDecoder().decode([Service].self, from: readStringData!)
            services = orderServiceArrayByDate(array: &services)
            return services
            
        } catch let error as NSError {
            print("Failed to read from file...", error)
            return []
        }
    }
    
    func saveServicesToFile(services: [Service]) {
        
        // Encode the array into a json string, and write it to a file
        let dataToWrite = try? JSONEncoder().encode(services)
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(Global.serviceFilePath)
        
        do {
            try dataToWrite?.write(to: fileURL)
        } catch let error as NSError {
            print("Failed to write to the file....", error)
        }
        
    }
    
    func orderServiceArrayByDate(array:inout [Service]) -> [Service] {
        
        array = array.sorted(by: {
            $0.date.compare($1.date) == .orderedDescending
        })
        
        return array
    }
    
    func getString(fromDate date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E, M.d.yy"
        
        return formatter.string(from: date)
    }
    
    func getTemplateData() {
        
        for service in Global.arrayOfServices {
            
            for room in service.rooms {
                
                if !Global.templateRooms.contains(room) {
                    let newRoom : Room = Room(title: room.title)
                    Global.templateRooms.insert(newRoom)
                }
                
            }
            
        }
        
        clearTemplateData()
    }
    
    func clearTemplateData() {
        
        for room in Global.templateRooms {
            room.isSelectedForTemplate = false
            room.headCount = 0
        }
        
    }
    
}

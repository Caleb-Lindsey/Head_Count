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
    static var templateDict = [String : Array<String>]()
    static var grayColor = UIColor(red: 20/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1)
    static var offWhiteColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1)
    static var headerFont : UIFont = UIFont(name: "DINCondensed-Bold", size: 45)!
    static var serviceFilePath : String = "HeadCountServices.json"
    
}

class DataSource {
    
    func getServiceData() -> [Service] {
        
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(Global.serviceFilePath)
        
        do {
            print("Retrieving Service Data...")
            let readString : String = try String(contentsOf: fileURL)
            let newReadString = readString.data(using: .utf8)
            print(newReadString!)
            
            var services = try JSONDecoder().decode([Service].self, from: newReadString!)
            services = orderServiceArrayByDate(array: &services)
            return services
            
        } catch let error as NSError {
            print("Failed to read from file...", error)
            return []
        }
        
    }
    
    func saveServicesToFile(services: [Service]) {
        print("Saving Data....")
        // Encode the array into a json string, and write it to a file
        let dataToWrite = try? JSONEncoder().encode(services)
        print(String(data: dataToWrite!, encoding: String.Encoding.utf8)!)
        print(dataToWrite!)
        
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(Global.serviceFilePath)
        
        do {
            print("Overwriting file....")
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
        
        var titles = Set<String>()
        var counters = Set<String>()
        var locations = Set<String>()
        var templateRooms = Set<Room>()
        
        for service in Global.arrayOfServices {
            
            if !titles.contains(service.title) {
                titles.insert(service.title)
                
                if var arr = Global.templateDict["Titles"] {
                    arr.append(service.title)
                    Global.templateDict["Titles"] = arr
                } else {
                    Global.templateDict["Titles"] = [service.title]
                }
                
            }
            
            if !counters.contains(service.counter) {
                counters.insert(service.counter)
                
                if var arr = Global.templateDict["Counters"] {
                    arr.append(service.counter)
                    Global.templateDict["Counters"] = arr
                } else {
                    Global.templateDict["Counters"] = [service.counter]
                }
                
            }
            
            if !locations.contains(service.location) {
                locations.insert(service.location)
                
                if var arr = Global.templateDict["Locations"] {
                    arr.append(service.location)
                    Global.templateDict["Locations"] = arr
                } else {
                    Global.templateDict["Locations"] = [service.location]
                }
                
            }
            
            for room in service.rooms {
                
                if !templateRooms.contains(room) {
                    templateRooms.insert(room)
                    
                    if var arr = Global.templateDict["Rooms"] {
                        arr.append(room.title)
                        Global.templateDict["Rooms"] = arr
                    } else {
                        Global.templateDict["Rooms"] = [room.title]
                    }
                    
                }
                
            }
            
        }
        
    }
    
}


















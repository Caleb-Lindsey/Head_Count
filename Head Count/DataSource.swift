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
    static var templateTitles : [String] = [String]()
    static var templateCounters : [String] = [String]()
    static var templateLocations : [String] = [String]()
    static var templateRooms : [Room] = [Room]()
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
        
        // Get Template Titles
        for service in Global.arrayOfServices {
            
            if Global.templateTitles != [] {
                for title in Global.templateTitles {
                    if service.title != title {
                        Global.templateTitles.append(title)
                    }
                }
            } else {
                Global.templateTitles = [service.title]
            }
            
        }
        
        // Get Template Counters
        for service in Global.arrayOfServices {
            
            if Global.templateCounters != [] {
                for counter in Global.templateCounters {
                    if service.counter != counter {
                        Global.templateCounters.append(counter)
                    }
                }
            } else {
                Global.templateCounters = [service.counter]
            }
            
        }
        
        // Get Template Locations
        for service in Global.arrayOfServices {
            
            if Global.templateLocations != [] {
                for location in Global.templateLocations {
                    if service.location != location {
                        Global.templateLocations.append(location)
                    }
                }
            } else {
                Global.templateLocations = [service.location]
            }
            
        }
        
        // Get Template Rooms
        
        
    }
    
}


















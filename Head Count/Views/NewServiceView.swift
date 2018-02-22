//
//  NewServiceView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/12/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class NewServiceView : HeadCountVC, UITableViewDataSource, UITableViewDelegate {
    
    var cellID : String = "cellID"
    var arrayOfNewRooms : [Room] = [Room]()
    
    var newServiceTable : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "New Event"
        
        if arrayOfNewRooms.count < 10 {
            fillRoomsToTen()
        }
        
        let newLayer = CAGradientLayer()
        newLayer.colors = [Global.grayColor.cgColor, UIColor.white.cgColor, Global.grayColor.cgColor]
        newLayer.frame = view.frame
        newLayer.frame.origin.y = (self.navigationController?.navigationBar.frame.maxY)!
        self.view.layer.insertSublayer(newLayer, at: 0)
        
        // Place New Service Table
        newServiceTable.frame = view.frame
        newServiceTable.delegate = self
        newServiceTable.dataSource = self
        newServiceTable.register(NewRoomCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(newServiceTable)
        
        self.newServiceTable.tableFooterView = NewServiceFooter(frame: CGRect(x: 0, y: 0, width: newServiceTable.frame.width, height: 65), viewController: self, tableView: newServiceTable,arrayOfRooms: arrayOfNewRooms)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNewRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NewRoomCell = NewRoomCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID, room: arrayOfNewRooms[indexPath.row])
        cell.roomtitle.text = arrayOfNewRooms[indexPath.row].title
        if arrayOfNewRooms[indexPath.row].headCount != 0 {
            cell.roomCount.text = "\(arrayOfNewRooms[indexPath.row].headCount)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.height / 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let newServiceHeader : NewServiceHeader = NewServiceHeader()
        return newServiceHeader
    }
    
    func fillRoomsToTen() {
        
        while arrayOfNewRooms.count < 10 {
            let newRoom : Room = Room(title: "", headCount: 0)
            arrayOfNewRooms.append(newRoom)
        }
        
    }
    
    @objc func addNewRoom() {
        
        let newRoom : Room = Room(title: "", headCount: 0)
        arrayOfNewRooms.append(newRoom)
        newServiceTable.reloadData()
        
        
    }
    
    @objc func completeService() {
        print("Tap")
//        let alertTitle : String = "Missing Requiered Fields"
//        var alertMessage : String = ""
//
//        if newSegmentField.text == "" {
//            newSegmentField.layer.borderWidth = 3
//            newSegmentField.layer.borderColor = UIColor.red.cgColor
//            alertMessage += "- Segment Name."
//        } else {
//            newSegmentField.layer.borderWidth = 0
//            newSegmentField.layer.borderColor = UIColor.clear.cgColor
//        }
//        if tempArray == [] {
//            rightTableView.layer.borderWidth = 3
//            rightTableView.layer.borderColor = UIColor.red.cgColor
//            alertMessage += "\n- Elements."
//        } else {
//            rightTableView.layer.borderWidth = 0
//            rightTableView.layer.borderColor = UIColor.clear.cgColor
//        }
//
//        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        
    }
    
}











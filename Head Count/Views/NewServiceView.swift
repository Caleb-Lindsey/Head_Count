//
//  NewServiceView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/12/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class NewServiceView : HeadCountVC, UITableViewDataSource, UITableViewDelegate {
    
    var cellIndex : Int!
    var cellID : String = "cellID"
    var arrayOfNewRooms : [Room] = [Room]()
    var dataHandle = DataSource()
    var template : Service!
    
    var newServiceTable : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    var newServiceHeader : NewServiceHeader = {
        let header = NewServiceHeader()
        return header
    }()
    
    var serviceFooter : NewServiceFooter = {
        let footer = NewServiceFooter()
        footer.completeButton.addTarget(self, action: #selector(completeService), for: .touchUpInside)
        footer.newRoomButton.addTarget(self, action: #selector(addNewRoom), for: .touchUpInside)
        return footer
    }()
    
    init(cellIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        self.cellIndex = cellIndex
    }
    
    init(cellIndex: Int, template: Service) {
        super.init(nibName: nil, bundle: nil)
        self.cellIndex = cellIndex
        self.template = template
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Place New Service Table
        newServiceTable.frame = view.frame
        newServiceTable.delegate = self
        newServiceTable.dataSource = self
        newServiceTable.register(NewRoomCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(newServiceTable)
        
        self.serviceFooter.frame = CGRect(x: 0, y: 0, width: newServiceTable.frame.width, height: 65)
        self.newServiceTable.tableFooterView = serviceFooter
        
        if cellIndex == 0 {
            self.navigationItem.title = "New Event"
            
            if arrayOfNewRooms.count < 10 {
                fillRoomsToTen()
            }
        } else {
            
            self.navigationItem.title = template.title
            self.arrayOfNewRooms = template.rooms
            self.newServiceHeader.titleField.text = template.title
            self.newServiceHeader.counterField.text = template.counter
            self.newServiceHeader.locationField.text = template.location
            self.newServiceHeader.datePicker.date = template.date
        
        }
        
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
        return newServiceHeader
    }
    
    func fillRoomsToTen() {
        
        while arrayOfNewRooms.count < 5 {
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
        let alertTitle : String = "Missing Requiered Fields"
        var alertMessage : String = ""
        var allRoomsEmpty : Bool = true

        if newServiceHeader.titleField.text == "" {
            alertMessage += "- Missing event title."
        }
        
        if newServiceHeader.counterField.text == "" {
            alertMessage += "\n- Missing name of counter."
        }
        
        if newServiceHeader.locationField.text == "" {
            alertMessage += "\n- Missing event location."
        }
        
        for room in arrayOfNewRooms {
            if room.title != "" {
                allRoomsEmpty = false
            }
        }
        
        if allRoomsEmpty {
            alertMessage += "\n- No rooms listed."
        }

        if alertMessage == "" && allRoomsEmpty == false {
            
            var arrayOfRoomsInUse : [Room] = []
            
            for room in arrayOfNewRooms {
                if room.title != "" {
                    arrayOfRoomsInUse.append(room)
                }
            }
            
            if cellIndex == 0 {
            
                let newService : Service = Service(title: newServiceHeader.titleField.text!, date: newServiceHeader.datePicker.date, rooms: arrayOfRoomsInUse, counter: newServiceHeader.counterField.text!, location: newServiceHeader.locationField.text!)
                
                self.navigationController?.pushViewController(ServiceView(service: newService, cellIndex: 0), animated: true)
                
            } else {
                
                self.template.title = newServiceHeader.titleField.text!
                self.template.counter = newServiceHeader.counterField.text!
                self.template.location = newServiceHeader.locationField.text!
                self.template.date = newServiceHeader.datePicker.date
                self.template.rooms = arrayOfNewRooms
                
                dataHandle.saveServicesToFile(services: Global.arrayOfServices)
                
                self.navigationController?.pushViewController(ServicesView(), animated: true)
                
            }
            
        } else {
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let backItem = UIBarButtonItem()
        backItem.title = "Edit"
        navigationItem.backBarButtonItem = backItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let backItem = UIBarButtonItem()
        backItem.title = "Events"
        navigationItem.backBarButtonItem = backItem
    }
    
}











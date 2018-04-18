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
    var service : Service!
    
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
        footer.orderRoomButton.addTarget(self, action: #selector(toggleEditMode), for: .touchUpInside)
        footer.newRoomButton.addTarget(self, action: #selector(addNewRoom), for: .touchUpInside)
        return footer
    }()
    
    init(cellIndex: Int, service: Service) {
        super.init(nibName: nil, bundle: nil)
        self.cellIndex = cellIndex
        self.service = service
    }
    
    init(templateArray: [Room]) {
        super.init(nibName: nil, bundle: nil)
        self.cellIndex = 0
        self.arrayOfNewRooms = templateArray
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
            
            if arrayOfNewRooms.count < 5 {
                fillRoomsToFive()
            }
        } else {
            
            self.navigationItem.title = service.title
            self.arrayOfNewRooms = service.rooms
            self.newServiceHeader.titleField.text = service.title
            self.newServiceHeader.counterField.text = service.counter
            self.newServiceHeader.locationField.text = service.location
            self.newServiceHeader.datePicker.date = service.date
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNewRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NewRoomCell = NewRoomCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID, room: arrayOfNewRooms[indexPath.row], viewController: self)
        cell.roomtitle.text = arrayOfNewRooms[indexPath.row].title
        if arrayOfNewRooms[indexPath.row].headCount != 0 {
            cell.roomCount.text = "\(arrayOfNewRooms[indexPath.row].headCount)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.height / 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return newServiceHeader
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing {
            return .none
        } else {
            return .delete
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            arrayOfNewRooms.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.arrayOfNewRooms[sourceIndexPath.row]
        arrayOfNewRooms.remove(at: sourceIndexPath.row)
        arrayOfNewRooms.insert(movedObject, at: destinationIndexPath.row)
    }
    
    func fillRoomsToFive() {
        
        while arrayOfNewRooms.count < 5 {
            let newRoom : Room = Room(title: "")
            arrayOfNewRooms.append(newRoom)
        }
        
    }
    
    @objc func addNewRoom() {
        
        let newRoom : Room = Room(title: "")
        arrayOfNewRooms.append(newRoom)
        newServiceTable.reloadData()
        
    }
    
    @objc func toggleEditMode() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.newServiceTable.isEditing = !self.newServiceTable.isEditing
        }) { (finished : Bool) in
            
        }
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
        
        for count in 0...arrayOfNewRooms.count - 1 {
            let cell : NewRoomCell =  self.newServiceTable.cellForRow(at: IndexPath(row: count, section: 0)) as! NewRoomCell
            if cell.roomtitle.text != "" {
                allRoomsEmpty = false
            }
        }
        
        if allRoomsEmpty {
            alertMessage += "\n- No rooms listed."
        }

        if alertMessage == "" {
            
            var arrayOfRoomsInUse : [Room] = []
            
            var count : Int = 0
            for room in arrayOfNewRooms {
                
                let cell : NewRoomCell = self.newServiceTable.cellForRow(at: IndexPath(row: count, section: 0)) as! NewRoomCell
                cell.applyFieldsToRoom()
                
                if room.title != "" {
                    arrayOfRoomsInUse.append(room)
                }
                count += 1
            }
            
            if cellIndex == 0 {
            
                let newService : Service = Service(title: newServiceHeader.titleField.text!, date: newServiceHeader.datePicker.date, rooms: arrayOfRoomsInUse, counter: newServiceHeader.counterField.text!, location: newServiceHeader.locationField.text!)
                
                self.navigationController?.pushViewController(ServiceView(service: newService, cellIndex: 0), animated: true)
                
            } else {
                
                self.service.title = newServiceHeader.titleField.text!
                self.service.counter = newServiceHeader.counterField.text!
                self.service.location = newServiceHeader.locationField.text!
                self.service.date = newServiceHeader.datePicker.date
                self.service.rooms = arrayOfNewRooms
                
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











//
//  ServiceView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/11/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class ServiceView : HeadCountVC, UITableViewDataSource, UITableViewDelegate {
    
    var service : Service!
    var cellIndex : Int!
    var cellID : String = "roomCell"
    var dataHandle = DataSource()
    
    var roomTableView : UITableView = {
        let tableView = UITableView()
        tableView.delaysContentTouches = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init(service: Service, cellIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        self.service = service
        self.cellIndex = cellIndex
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = service.location
        if cellIndex == 0 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(returnToMain))
        } else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(returnToMain))
        }
        
        // Place Room Table View
        roomTableView.frame = self.view.frame
        roomTableView.delegate = self
        roomTableView.dataSource = self
        roomTableView.register(RoomCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(roomTableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : RoomCell = RoomCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID, room: service.rooms[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.frame.height / 3
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView : ServiceHeader = ServiceHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 3), service: self.service, controller: self)
        return headerView

    }
    
    @objc func returnToMain() {
        
        if cellIndex == 0 {
            Global.arrayOfServices.append(service)
            Global.arrayOfServices = dataHandle.orderServiceArrayByDate(array: &Global.arrayOfServices)
            dataHandle.saveServicesToFile(services: Global.arrayOfServices)
            self.navigationController?.pushViewController(ServicesView(), animated: true)
        } else {
            self.navigationController?.pushViewController(NewServiceView(cellIndex: cellIndex, service: service), animated: true)
        }
    }
}













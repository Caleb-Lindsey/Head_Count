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
    var arrayOfTypes : [String] = [""]
    var cellID : String = "roomCell"
    
    var roomTableView : UITableView = {
        let tableView = UITableView()
        tableView.delaysContentTouches = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.clear
        return tableView
    }()
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, service: Service) {
        super.init(nibName: nil, bundle: nil)
        self.service = service
        self.arrayOfTypes.append(contentsOf: self.service.getArrayOfTypes())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Smithfield"
        
        let newLayer = CAGradientLayer()
        newLayer.colors = [Global.grayColor.cgColor, UIColor.white.cgColor]
        newLayer.frame = view.frame
        newLayer.frame.origin.y = (self.navigationController?.navigationBar.frame.maxY)!
        self.view.layer.insertSublayer(newLayer, at: 0)
        
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
        if section == 0 {
            return self.view.frame.height / 3
        } else {
            return 30
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView : ServiceHeader = ServiceHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 3), service: self.service)
            return headerView
        } else {
            return nil
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfTypes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayOfTypes[section]
    }
    
}













//
//  ServiceView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/11/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class ServiceView : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var service : Service!
    var cellID : String = "roomCell"
    
    var roomTableView : UITableView = {
        let tableView = UITableView()
        tableView.delaysContentTouches = false
        return tableView
    }()
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, service: Service) {
        super.init(nibName: nil, bundle: nil)
        self.service = service
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Smithfield"
        
        view.backgroundColor = Global.grayColor
        
        // Place Room Table View
        roomTableView.frame = self.view.frame
        roomTableView.delegate = self
        roomTableView.dataSource = self
        roomTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(roomTableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = roomTableView.dequeueReusableCell(withIdentifier: cellID)!
        cell.textLabel?.text = service.rooms[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.frame.height / 3
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView : ServiceHeader = ServiceHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 3), service: self.service)
        return headerView

    }
    
}












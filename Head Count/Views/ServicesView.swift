//
//  ServiceView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/21/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class ServicesView : HeadCountVC, UITableViewDataSource, UITableViewDelegate {
    
    let menuCellID : String = "menuCell"
    var arrayOfServices : [Service] = []
    var dataHandle = DataSource()
    
    let menu : UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = UIColor.clear
        return tableview
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        menu.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Events"
        self.navigationItem.setHidesBackButton(true, animated:false)
        
        Global.arrayOfServices = dataHandle.getServiceData()
        dataHandle.getTemplateData()
        menu.reloadData()
        
        // Place Table View
        menu.frame = view.frame
        menu.dataSource = self
        menu.delegate = self
        menu.register(NewServiceCell.self, forCellReuseIdentifier: "newCellID")
        menu.register(ServiceCell.self, forCellReuseIdentifier: menuCellID)
        view.addSubview(menu)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.arrayOfServices.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell : NewServiceCell = NewServiceCell(style: UITableViewCellStyle.default, reuseIdentifier: "newCellID")
            return cell
        } else {
            let thisService : Service = Global.arrayOfServices[indexPath.row - 1]
            let cell : ServiceCell = ServiceCell(style: UITableViewCellStyle.default, reuseIdentifier: menuCellID, title: thisService.title, counter: thisService.counter, date: thisService.date, destination: UIViewController())
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(NewServiceView(cellIndex: 0), animated: true)
        } else {
            self.navigationController?.pushViewController(ServiceView(service: Global.arrayOfServices[indexPath.row - 1], cellIndex: indexPath.row), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row != 0 {
            return .delete
        } else {
            return .none
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            Global.arrayOfServices.remove(at: indexPath.row - 1)
            dataHandle.saveServicesToFile(services: Global.arrayOfServices)
            tableView.reloadData()
            
        }
        
    }
    
}













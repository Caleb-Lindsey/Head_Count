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
        super.viewWillAppear(true)
        
        menu.reloadData()
        dataHandle.getTemplateData()
        Global.arrayOfServices = dataHandle.orderServiceArrayByDate(array: &Global.arrayOfServices)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Services"
        
        // Place Background Image
        self.backgroundImage.image = UIImage(named: "crowd")
        self.backgroundImage.layer.opacity = 0.6
        
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
            let cell : ServiceCell = ServiceCell(style: UITableViewCellStyle.default, reuseIdentifier: menuCellID, title: thisService.title, counter: thisService.counter, date: thisService.date)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
           return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if Global.templateRooms.isEmpty {
                self.navigationController?.pushViewController(NewServiceView(templateArray: []), animated: true)
            } else {
                self.navigationController?.pushViewController(TemplateView(), animated: true)
            }
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
            dataHandle.getTemplateData()
        }
    }
}

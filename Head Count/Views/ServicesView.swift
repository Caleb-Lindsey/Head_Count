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
    
    let menu : UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = UIColor.clear
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Services"
        
        // Place Table View
        menu.frame = view.frame
        menu.dataSource = self
        menu.delegate = self
        menu.register(ServiceCell.self, forCellReuseIdentifier: menuCellID)
        view.addSubview(menu)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.arrayOfServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thisService : Service = Global.arrayOfServices[indexPath.row]
        let cell : ServiceCell = ServiceCell(style: UITableViewCellStyle.default, reuseIdentifier: menuCellID, title: thisService.title, counter: thisService.counter, destination: UIViewController())
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ServiceView(nibName: nil, bundle: nil, service: Global.arrayOfServices[indexPath.row]), animated: true)
        
    }
    
}













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
    
    var newServiceTable : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "New Event"
        
        let newLayer = CAGradientLayer()
        newLayer.colors = [Global.grayColor.cgColor, UIColor.white.cgColor]
        newLayer.frame = view.frame
        newLayer.frame.origin.y = (self.navigationController?.navigationBar.frame.maxY)!
        self.view.layer.insertSublayer(newLayer, at: 0)
        
        // Place New Service Table
        newServiceTable.frame = view.frame
        newServiceTable.delegate = self
        newServiceTable.dataSource = self
        newServiceTable.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.addSubview(newServiceTable)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = newServiceTable.dequeueReusableCell(withIdentifier: cellID)!
        cell.textLabel?.text = "hello"
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
    
}











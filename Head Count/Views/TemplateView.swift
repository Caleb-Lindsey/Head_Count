//
//  TemplateView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 4/8/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class TemplateView : HeadCountVC, UITableViewDelegate, UITableViewDataSource {
    
    // Variables
    
    let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = Global.offWhiteColor
        return table
    }()
    
    let footerView : UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Place TableView
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TemplateCell.self, forCellReuseIdentifier: "CellID")
        self.view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TemplateCell = TemplateCell(style: UITableViewCellStyle.default, reuseIdentifier: "CellID")
        cell.textLabel?.text = Global.templateLocations[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.templateLocations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}



















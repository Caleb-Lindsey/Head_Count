//
//  TemplateView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 4/8/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class TemplateView : HeadCountVC, UITableViewDelegate, UITableViewDataSource {
    
    struct TemplateObject {
        var type : String!
        var members : [String]!
    }
    var templateObjects : [TemplateObject] = [TemplateObject]()
    
    let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = Global.offWhiteColor
        table.allowsMultipleSelection = true
        return table
    }()
    
    let footerView : UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(importTemplate))
        
        // Place TableView
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        self.view.addSubview(tableView)
        
        for (key, value) in Global.templateDict {
            templateObjects.append(TemplateObject(type: key, members: value))
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return templateObjects[section].type
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return templateObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID")!
        cell.textLabel?.text = templateObjects[indexPath.section].members[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return templateObjects[section].members.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    @objc func importTemplate() {
        
        self.navigationController?.pushViewController(NewServiceView(cellIndex: 0), animated: true)
        
    }
    
}



















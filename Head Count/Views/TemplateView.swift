//
//  TemplateView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 4/8/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class TemplateView : HeadCountVC, UITableViewDelegate, UITableViewDataSource {
    
    var roomsToUse : [Room] = [Room]()
    
    let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.clear
        table.allowsMultipleSelection = true
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(importTemplate))
        
        // Place TableView
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TemplateCell.self, forCellReuseIdentifier: "CellID")
        self.view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TemplateCell = TemplateCell(reuseIdentifier: "CellID", room: Global.templateRooms[indexPath.row])
        if cell.room.isSelectedForTemplate {
            cell.sideView.backgroundColor = Global.blueColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.templateRooms.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView : TemplateHeader = TemplateHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 65))
        return myView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        roomsToUse = []
    }
    
    @objc func importTemplate() {
        
        for room in Global.templateRooms {
            if room.isSelectedForTemplate {
                if roomsToUse == [] {
                    roomsToUse = [room]
                } else {
                    roomsToUse.append(room)
                }
            }
        }
        
        self.navigationController?.pushViewController(NewServiceView(templateArray: roomsToUse), animated: true)
        
        
    }
    
}



















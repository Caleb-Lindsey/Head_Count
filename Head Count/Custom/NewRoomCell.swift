//
//  NewRoomCell.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/13/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class NewRoomCell : UITableViewCell {
    
    var room : Room!
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 30))
    
    var roomtitle : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Room Title"
        return textField
    }()
    
    var roomCount : UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = UIColor.gray
        textField.keyboardType = .numberPad
        textField.placeholder = "#"
        return textField
    }()
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, room: Room) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.room = room
        self.selectionStyle = .none
        self.contentView.layer.borderWidth = 0.35
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        // Place Room Title
        roomtitle.frame = CGRect(x: 0, y: 0, width: contentView.frame.width * (3/4) - 5, height: contentView.frame.height)
        roomtitle.leftView = paddingView
        roomtitle.leftViewMode = .always
        roomtitle.text = room.title
        contentView.addSubview(roomtitle)
        
        // Place Room Count
        roomCount.frame = CGRect(x: roomtitle.frame.maxX, y: 0, width: contentView.frame.width * (1/4), height: contentView.frame.height)
        if room.headCount > 0 {
            roomCount.text = "\(room.headCount)"
        }
        contentView.addSubview(roomCount)
        
    }
    
    
    
}

















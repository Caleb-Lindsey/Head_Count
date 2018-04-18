//
//  RoomCell.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/11/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class RoomCell : UITableViewCell {
    
    var room : Room!
    
    var roomtitle : UILabel = {
        let label = UILabel()
        return label
    }()
    
    var roomCount : UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = UIColor.gray
        label.font = UIFont(name: "Helvetica", size: 18)
        return label
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
        roomtitle.frame = CGRect(x: 10, y: 0, width: self.contentView.frame.width * (2/3) - 10, height: self.contentView.frame.height)
        roomtitle.text = self.room.title
        self.contentView.addSubview(roomtitle)
        
        // Place Room Count
        roomCount.frame = CGRect(x: self.contentView.frame.width - self.contentView.frame.height - 15, y: 0, width: self.contentView.frame.height, height: self.contentView.frame.height)
        roomCount.text = "\(self.room.headCount)"
        self.contentView.addSubview(roomCount)
        
    }
    
    
    
}


















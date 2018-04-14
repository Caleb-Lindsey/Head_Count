//
//  TemplateCell.swift
//  Head Count
//
//  Created by Caleb Lindsey on 4/8/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class TemplateCell : UITableViewCell {
    
    var room : Room!
    
    let sideView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    init(reuseIdentifier: String?, room: Room) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        self.room = room
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        sideView.frame = CGRect(x: 0, y: 5, width: 5, height: self.contentView.frame.height - 10)
        self.contentView.addSubview(sideView)
        
        titleLabel.frame = CGRect(x: sideView.frame.maxX + 10, y: 0, width: contentView.frame.width - sideView.frame.width - 10 - 5, height: contentView.frame.height)
        titleLabel.text = self.room.title
        self.contentView.addSubview(titleLabel)
        
    }
        
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        room.isSelectedForTemplate = !room.isSelectedForTemplate
        
        if room.isSelectedForTemplate {
            sideView.backgroundColor = Global.blueColor
        } else {
            sideView.backgroundColor = UIColor.lightGray
        }
        
    }
    
    
    
}









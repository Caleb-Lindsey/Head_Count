//
//  NewServiceCell.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/12/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class NewServiceCell : UITableViewCell {
    
    let backView : UIView = {
        let view = UIView()
        view.backgroundColor = Global.offWhiteColor
        view.layer.cornerRadius = 3
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Create New"
        label.textColor = Global.grayColor
        label.font = UIFont(name: "DINCondensed-Bold", size: 30)
        //label.layer.borderWidth = 1
        return label
    }()
    
    let subLabel : UILabel = {
        let label = UILabel()
        label.text = "Take count for a new event! Past events will be listed below."
        label.textColor = UIColor.darkGray
        label.font = UIFont(name: "Helvetica", size: 15)
        label.numberOfLines = 2
        //label.layer.borderWidth = 1
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let labelHeight = contentView.frame.height / 3
        
        // Place Back View
        backView.frame = CGRect(x: 15, y: 7.5, width: self.contentView.frame.width - 30, height: self.contentView.frame.height - 15)
        self.addSubview(backView)
        
        // Place Title Label
        titleLabel.frame = CGRect(x: 15, y: 5, width: backView.frame.width - 30, height: labelHeight)
        backView.addSubview(titleLabel)
        
        // Place SubLabe
        subLabel.frame = CGRect(x: 15, y: titleLabel.frame.maxY, width: titleLabel.frame.width, height: backView.frame.height - labelHeight - 10)
        backView.addSubview(subLabel)
        
    }
    
}













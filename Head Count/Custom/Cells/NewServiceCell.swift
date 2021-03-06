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
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 3
        view.layer.borderWidth = 0.35
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.opacity = 0.8
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Create New"
        label.textColor = UIColor.white
        label.font = UIFont(name: "DINCondensed-Bold", size: 30)
        return label
    }()
    
    let subLabel : UILabel = {
        let label = UILabel()
        label.text = "Take count for a new service! Past services will be listed below."
        label.textColor = UIColor.white
        label.font = UIFont(name: "DamascusLight", size: 16)
        label.numberOfLines = 2
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
        backView.frame = CGRect(x: 10, y: 7.5, width: self.contentView.frame.width - 20, height: self.contentView.frame.height - 15)
        self.addSubview(backView)
        
        // Place Title Label
        titleLabel.frame = CGRect(x: 15, y: 5, width: backView.frame.width - 30, height: labelHeight)
        backView.addSubview(titleLabel)
        
        // Place SubLabe
        subLabel.frame = CGRect(x: 15, y: titleLabel.frame.maxY, width: titleLabel.frame.width, height: backView.frame.height - labelHeight - 10)
        backView.addSubview(subLabel)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            backView.backgroundColor = UIColor.gray
        } else {
            backView.backgroundColor = UIColor.darkGray
        }
    }
}

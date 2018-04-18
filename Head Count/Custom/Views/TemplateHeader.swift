//
//  TemplateHeader.swift
//  Head Count
//
//  Created by Caleb Lindsey on 4/14/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class TemplateHeader : UIView {
    
    var messageLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.text = "Choose from rooms you've used before to use as a template."
        label.font = UIFont(name: "DINCondensed-Bold", size: 22)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Global.grayColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        // Place Message Label
        messageLabel.frame = CGRect(x: 15, y: 0, width: self.frame.width - 30, height: self.frame.height)
        self.addSubview(messageLabel)
        
    }
    
}

//
//  ServiceHeader.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/11/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class ServiceHeader : UIView {
    
    var service : Service!

    var titleLabel : UILabel = {
        let label = UILabel()
        //label.layer.borderColor = UIColor.white.cgColor
        //label.layer.borderWidth = 1
        label.textColor = UIColor.white
        label.font = UIFont(name: "DINCondensed-Bold", size: 45)
        return label
    }()
    
    var dateLabel : UILabel = {
        let label = UILabel()
        //label.layer.borderColor = UIColor.white.cgColor
        //label.layer.borderWidth = 1
        label.textColor = UIColor.white
        label.font = UIFont(name: "Helvetica", size: 18)
        return label
    }()
    
    var counterLabel : UILabel = {
        let label = UILabel()
        //label.layer.borderColor = UIColor.white.cgColor
        //label.layer.borderWidth = 1
        label.textColor = UIColor.white
        label.font = UIFont(name: "Helvetica", size: 18)
        return label
    }()
    
    var messageButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "messages_icon"), for: .normal)
        return button
    }()
    
    init(frame: CGRect, service: Service) {
        super.init(frame: frame)
        self.service = service
        self.backgroundColor = Global.grayColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        // Place Title Label
        titleLabel.frame = CGRect(x: 15, y: 15, width: self.frame.width - 30, height: self.frame.height / 4)
        titleLabel.text = service.title
        self.addSubview(titleLabel)
        
        // Place Counter Label
        counterLabel.frame = CGRect(x: 15, y: titleLabel.frame.maxY, width: self.frame.width / 2 - 15, height: titleLabel.frame.height / 2)
        counterLabel.text = service.counter
        self.addSubview(counterLabel)
        
        // Place Date Label
        dateLabel.frame = CGRect(x: 15, y: counterLabel.frame.maxY, width: counterLabel.frame.width, height: counterLabel.frame.height)
        dateLabel.text = "1/21/18"
        self.addSubview(dateLabel)
        
        // Place Message Button
        messageButton.frame = CGRect(x: self.frame.width - 44 - 5, y: self.frame.height - 44 - 5, width: 44, height: 44)
        self.addSubview(messageButton)
        
    }
    
}















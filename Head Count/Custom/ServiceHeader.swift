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
        label.font = Global.headerFont
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
    
    var emailButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "email_icon"), for: .normal)
        return button
    }()
    
    var messageButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "messages_icon"), for: .normal)
        return button
    }()
    
    var totalLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "DINCondensed-Bold", size: 25)
        return label
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
        
        // Place Email Button
        emailButton.frame = CGRect(x: self.frame.width - 44 - 5, y: self.frame.height - 44 - 5, width: 44, height: 44)
        self.addSubview(emailButton)
        
        // Place Message Button
        messageButton.frame = CGRect(x: emailButton.frame.origin.x - 44 - 5, y: emailButton.frame.origin.y, width: 44, height: 44)
        self.addSubview(messageButton)
        
        // Place Total Label
        totalLabel.frame = CGRect(x: 15, y: self.frame.height - 50, width: self.frame.width / 4, height: 50)
        totalLabel.text = "Total: \(self.service.getTotal())"
        self.addSubview(totalLabel)
        
    }
    
}















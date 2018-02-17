//
//  NewServiceHeader.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/24/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class NewServiceHeader : UIView {
    
    var titleField : CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Event Title"
        return textField
    }()
    
    var counterField : CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Name of Counter"
        return textField
    }()
    
    var locationField : CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Location of Event"
        return textField
    }()
    
    var dateButton : UIButton = {
        let button = UIButton()
        button.setTitle("1/21/18", for: .normal)
        button.tintColor = UIColor.white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    var useTapper : UIButton = {
        let button = UIButton()
        button.setTitle("Use Tapper", for: .normal)
        button.tintColor = UIColor.white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 4
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Global.grayColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        // Place Title Field
        titleField.frame = CGRect(x: 15, y: 15, width: self.frame.width - 30, height: self.frame.height / 5)
        self.addSubview(titleField)
        
        // Place Counter Field
        counterField.frame = CGRect(x: 15, y: titleField.frame.maxY + 5, width: titleField.frame.width, height: titleField.frame.height)
        self.addSubview(counterField)
        
        // Place Location Field
        locationField.frame = CGRect(x: 15, y: counterField.frame.maxY + 5, width: counterField.frame.width, height: counterField.frame.height)
        self.addSubview(locationField)
        
        // Place Use Tapper Button
        useTapper.frame = CGRect(x: self.frame.width / 2, y: locationField.frame.maxY + 5, width: self.frame.width / 2 - 15, height: locationField.frame.height)
        self.addSubview(useTapper)
        
    }
    
}

















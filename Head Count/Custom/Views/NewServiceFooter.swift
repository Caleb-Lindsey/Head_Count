//
//  NewServiceFooter.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/14/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class NewServiceFooter : UIView {
    
    var newRoomButton : UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 4
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    var orderRoomButton : UIButton = {
        let button = UIButton()
        button.setTitle("Order", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 4
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    var completeButton : UIButton = {
        let button = UIButton()
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 4
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Global.grayColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        // Place New Room Button
        newRoomButton.frame = CGRect(x: 15, y: 5, width: self.frame.width / 4 - 15 - 7.5, height: self.frame.height - 15)
        self.addSubview(newRoomButton)
        
        // Place Order Rooms Button
        orderRoomButton.frame = CGRect(x: newRoomButton.frame.maxX + 15, y: 5, width: newRoomButton.frame.width, height: newRoomButton.frame.height)
        self.addSubview(orderRoomButton)
        
        // Place Complete Button
        completeButton.frame = CGRect(x: self.frame.width - (newRoomButton.frame.width * 2) - 15, y: 5, width: newRoomButton.frame.width * 2, height: newRoomButton.frame.height)
        self.addSubview(completeButton)
    }
}

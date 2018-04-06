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
        button.setTitle("Add Room", for: .normal)
        button.tintColor = UIColor.white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 4
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    var completeButton : UIButton = {
        let button = UIButton()
        button.setTitle("Complete", for: .normal)
        button.tintColor = UIColor.white
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
        newRoomButton.frame = CGRect(x: 15, y: 5, width: self.frame.width / 2 - 15 - 7.5, height: self.frame.height - 10)
        self.addSubview(newRoomButton)
        
        // Place Complete Button
        completeButton.frame = CGRect(x: newRoomButton.frame.maxX + 15, y: 5, width: newRoomButton.frame.width, height: newRoomButton.frame.height)
        self.addSubview(completeButton)
        
    }
    
}

















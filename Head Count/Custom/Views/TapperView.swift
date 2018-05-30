//
//  TapperView.swift
//  Head Count
//
//  Created by Caleb Lindsey on 4/14/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class TapperView : UIView {
    
    var room: Room!
    var roomCell : NewRoomCell!
    var viewController : UIViewController!
    var navHeight : CGFloat!
    var count : Int!
    
    var numberLabel : UILabel = {
        let label = UILabel()
        label.textColor = Global.blueColor
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 100)
        return label
    }()
    
    var clearButton : UIButton = {
        let button = UIButton()
        button.setTitle("-1 or Hold to clear", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.backgroundColor = UIColor.darkGray
        button.layer.borderWidth = 0.5
        button.layer.borderColor = Global.grayColor.cgColor
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(decrementByOne), for: .touchUpInside)
        return button
    }()
    
    var useButton : UIButton = {
        let button = UIButton()
        button.setTitle("Use Count", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.backgroundColor = UIColor.darkGray
        button.layer.borderWidth = 0.5
        button.layer.borderColor = Global.grayColor.cgColor
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
        button.addTarget(self, action: #selector(useCount), for: .touchUpInside)
        return button
    }()
    
    var tapperButton : UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .highlighted)
        button.backgroundColor = Global.grayColor
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 200)
        button.addTarget(self, action: #selector(incrementByOne), for: .touchUpInside)
        return button
    }()
    
    var cancelButton : UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 30)
        button.setTitleColor(Global.blueColor, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.addTarget(self, action: #selector(dismissTapperView), for: .touchUpInside)
        return button
    }()
    
    init(roomCell: NewRoomCell, viewController: UIViewController) {
        super.init(frame: CGRect())
        
        self.roomCell = roomCell
        self.viewController = viewController
        self.navHeight = (viewController.navigationController?.navigationBar.frame.height)!
        self.backgroundColor = Global.grayColor
        
        if let count = Int(roomCell.roomCount.text!) {
            self.count = count
        } else {
            self.count = 0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(clearCount))
        clearButton.addGestureRecognizer(longGesture)
        
        // Place Number Label
        numberLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height / 4)
        numberLabel.text = "\((self.count)!)"
        self.addSubview(numberLabel)
        
        // Place Clear Button
        clearButton.frame = CGRect(x: 0, y: numberLabel.frame.maxY, width: self.frame.width / 2, height: 50)
        self.addSubview(clearButton)
        
        // Place Use Button
        useButton.frame = CGRect(x: clearButton.frame.maxX, y: numberLabel.frame.maxY, width: self.frame.width / 2, height: 50)
        self.addSubview(useButton)
        
        // Place Tapper Button
        tapperButton.frame = CGRect(x: 0, y: clearButton.frame.maxY, width: self.frame.width, height: self.frame.height - clearButton.frame.height - numberLabel.frame.height - navHeight)
        self.addSubview(tapperButton)
        
        // Place Cancel Button
        cancelButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        self.addSubview(cancelButton)
    }
    
    @objc func incrementByOne() {
        count = count + 1
        numberLabel.text = "\((count)!)"
    }
    
    @objc func decrementByOne() {
        if count > 0 {
            count = count - 1
            numberLabel.text = "\((count)!)"
        }
    }
    
    @objc func clearCount() {
        count = 0
        numberLabel.text = "\((count)!)"
    }
    
    @objc func useCount() {
        self.roomCell.roomCount.text = "\((count)!)"
        self.roomCell.room.headCount = count
        dismissTapperView()
    }
    
    @objc func dismissTapperView() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.frame.origin.y = self.viewController.view.frame.height
        }) { (finished : Bool) in
            self.removeFromSuperview()
            self.viewController.navigationItem.hidesBackButton = false
        }
    }
}

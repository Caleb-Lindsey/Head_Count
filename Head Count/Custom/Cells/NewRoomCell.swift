//
//  NewRoomCell.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/13/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class NewRoomCell : UITableViewCell, UITextFieldDelegate {
    
    var room : Room!
    var viewController : NewServiceView!
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 30))
    
    var roomtitle : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Room Title"
        return textField
    }()
    
    var roomCount : UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = UIColor.gray
        textField.keyboardType = .numberPad
        textField.placeholder = "#"
        return textField
    }()
    
    let dragView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, room: Room, viewController : NewServiceView) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.room = room
        self.viewController = viewController
        self.selectionStyle = .none
        //self.contentView.layer.borderWidth = 0.35
        //self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addDoneButtonOnKeyboard()
        
        // Place Room Title
        roomtitle.frame = CGRect(x: 0, y: 0, width: contentView.frame.width * (3/4) - 5, height: contentView.frame.height)
        roomtitle.leftView = paddingView
        roomtitle.leftViewMode = .always
        roomtitle.text = room.title
        roomtitle.delegate = self
        contentView.addSubview(roomtitle)
        
        // Place Room Count
        roomCount.frame = CGRect(x: roomtitle.frame.maxX, y: 0, width: contentView.frame.width * (1/4), height: contentView.frame.height)
        roomCount.delegate = self
        if room.headCount > 0 {
            roomCount.text = "\(room.headCount)"
        }
        contentView.addSubview(roomCount)
        
    }
    
    func addDoneButtonOnKeyboard() {
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 25))
        doneToolbar.barStyle = UIBarStyle.blackTranslucent
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "close", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        done.tintColor = UIColor.white
        let useTapper : UIBarButtonItem = UIBarButtonItem(title: "Use Tapper", style: UIBarButtonItemStyle.plain, target: self, action: #selector(openTapper))
        useTapper.tintColor = UIColor.white
        
        var items = [UIBarButtonItem]()
        items.append(useTapper)
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.roomCount.inputAccessoryView = doneToolbar
        self.roomtitle.inputAccessoryView = doneToolbar
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == roomtitle {
            self.room.title = roomtitle.text!
        } else {
            if roomCount.text != "" {
                self.room.headCount = Int(roomCount.text!)!
            }
            
        }
        
    }
    
    @objc func doneButtonAction() {
        self.roomCount.resignFirstResponder()
        self.roomtitle.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let pointInTable : CGPoint = roomtitle.superview!.convert(roomtitle.frame.origin, to: viewController.newServiceTable)
        var contentOffset : CGPoint = viewController.newServiceTable.contentOffset
        contentOffset.y = pointInTable.y
        
        if let accessoryView = roomtitle.inputAccessoryView {
            contentOffset.y -= accessoryView.frame.size.height
        }
        
        contentOffset.y -= viewController.newServiceTable.frame.height / 3 + 55
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.viewController.newServiceTable.contentOffset = contentOffset
        }, completion: nil)
        
        return true
        
    }
    
    @objc func openTapper() {
        
        self.viewController.navigationItem.hidesBackButton = true
        self.endEditing(true)
        
        let tapperView : TapperView = TapperView(roomCell: self, viewController: viewController)
        tapperView.frame = CGRect(x: 0, y: self.viewController.view.frame.height, width: self.viewController.view.frame.width, height: self.viewController.view.frame.height)
        self.viewController.view.addSubview(tapperView)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            tapperView.frame.origin.y = (self.viewController.navigationController?.navigationBar.frame.maxY)!
            
        }) { (finished : Bool) in
        }
        
    }
    
    func applyFieldsToRoom() {
        
        if self.roomtitle.text != "" {
            self.room.title = self.roomtitle.text!
        }
        
        if self.roomCount.text != "" {
            self.room.headCount = Int(self.roomCount.text!)!
        }
    
    }
    
    override func willTransition(to state: UITableViewCellStateMask) {
        super.willTransition(to: state)
    }
    
}

















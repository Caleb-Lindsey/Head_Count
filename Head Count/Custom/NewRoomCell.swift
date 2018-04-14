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
    var tableView : UITableView!
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
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, room: Room, tableView : UITableView) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.room = room
        self.tableView = tableView
        self.selectionStyle = .none
        self.contentView.layer.borderWidth = 0.35
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == roomtitle {
            self.room.title = roomtitle.text!
        } else {
            if roomCount.text != "" {
                self.room.headCount = Int(roomCount.text!)!
            }
            
        }
        
    }
    
    func addDoneButtonOnKeyboard() {
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 25))
        doneToolbar.barStyle = UIBarStyle.blackTranslucent
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.roomCount.inputAccessoryView = doneToolbar
        self.roomtitle.inputAccessoryView = doneToolbar
        
    }
    
    @objc func doneButtonAction() {
        self.roomCount.resignFirstResponder()
        self.roomtitle.resignFirstResponder()
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.tableView.contentOffset.y = 0
        }, completion: nil)
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let pointInTable : CGPoint = roomtitle.superview!.convert(roomtitle.frame.origin, to: tableView)
        var contentOffset : CGPoint = tableView.contentOffset
        contentOffset.y = pointInTable.y
        
        if let accessoryView = roomtitle.inputAccessoryView {
            contentOffset.y -= accessoryView.frame.size.height
        }
        
        contentOffset.y -= tableView.frame.height / 3 + 55
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.tableView.contentOffset = contentOffset
        }, completion: nil)
        
        return true
        
    }
    
    
    
}

















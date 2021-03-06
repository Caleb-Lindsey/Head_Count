//
//  NewServiceHeader.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/24/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class NewServiceHeader : UIView, UITextFieldDelegate {
    
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
    
    var datePicker : UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.setValue(Global.blueColor, forKeyPath: "textColor")
        picker.maximumDate = Date()
        return picker
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
        titleField.delegate = self
        self.addSubview(titleField)
        
        // Place Counter Field
        counterField.frame = CGRect(x: 15, y: titleField.frame.maxY + 5, width: titleField.frame.width, height: titleField.frame.height)
        counterField.delegate = self
        self.addSubview(counterField)
        
        // Place Location Field
        locationField.frame = CGRect(x: 15, y: counterField.frame.maxY + 5, width: counterField.frame.width, height: counterField.frame.height)
        locationField.delegate = self
        self.addSubview(locationField)
        
        // Place Date Picker
        datePicker.frame = CGRect(x: 15, y: locationField.frame.maxY + 5, width: locationField.frame.width, height: self.frame.height - (locationField.frame.height * 3) - 15 - 5 - 5 - 5)
        self.addSubview(datePicker)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
}

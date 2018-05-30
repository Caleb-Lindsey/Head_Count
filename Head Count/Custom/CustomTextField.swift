//
//  CustomTextField.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/12/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class CustomTextField : UITextField {
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 30))
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 35))
        self.backgroundColor = Global.offWhiteColor
        self.leftView = self.paddingView
        self.returnKeyType = UIReturnKeyType.done
        self.leftViewMode = .always
        self.layer.cornerRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

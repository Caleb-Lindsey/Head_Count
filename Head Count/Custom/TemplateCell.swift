//
//  TemplateCell.swift
//  Head Count
//
//  Created by Caleb Lindsey on 4/8/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class TemplateCell : UITableViewCell {
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.layer.borderWidth = 0.5
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if selected {
            
        } else {
            
        }
        
    }
    
}









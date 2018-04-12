//
//  MenuCell.swift
//  Head Count
//
//  Created by Caleb Lindsey on 1/23/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class ServiceCell : UITableViewCell {
    
    var title : String!
    var date : Date!
    var counter : String!
    var destination : UIViewController!
    
    let backView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.layer.cornerRadius = 3
        view.layer.borderWidth = 0.35
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        //label.layer.borderWidth = 0.5
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .right
        //label.layer.borderWidth = 0.5
        return label
    }()
    
    let counterLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, title: String, counter: String, date: Date, destination: UIViewController) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.title = title
        self.date = date
        self.counter = counter
        self.destination = destination
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let labelHeight = contentView.frame.height / 3
        
        backView.frame = CGRect(x: 15, y: 7.5, width: self.contentView.frame.width - 30, height: self.contentView.frame.height - 15)
        self.addSubview(backView)
        
        titleLabel.frame = CGRect(x: 15, y: 0, width: backView.frame.width / 2 - 15, height: labelHeight)
        titleLabel.text = self.title
        backView.addSubview(titleLabel)
        
        dateLabel.frame = CGRect(x: titleLabel.frame.maxX + 15, y: 0, width: titleLabel.frame.width - 15, height: titleLabel.frame.height)
        dateLabel.text = DataSource().getString(fromDate: date)
        backView.addSubview(dateLabel)
        
        counterLabel.frame = CGRect(x: 15, y: titleLabel.frame.maxY, width: dateLabel.frame.width, height: dateLabel.frame.height)
        counterLabel.text = self.counter
        backView.addSubview(counterLabel)
        
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        if selected {
//            backView.backgroundColor = UIColor.lightGray
//        } else {
//            backView.backgroundColor = UIColor.white
//        }
//    }
    
}















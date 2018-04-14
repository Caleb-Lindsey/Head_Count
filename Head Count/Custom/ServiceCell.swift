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
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 3
        //view.layer.borderWidth = 0.35
        //view.layer.borderColor = UIColor.white.cgColor
        view.layer.opacity = 0.8
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "DINCondensed-Bold", size: 22)
        //label.layer.borderWidth = 0.5
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .right
        label.font = UIFont(name: "DamascusLight", size: 18)
        //label.layer.borderWidth = 0.5
        return label
    }()
    
    let counterLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "DamascusLight", size: 18)
        return label
    }()
    
    let chevronImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Chevron")
        return imageView
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
        
        titleLabel.frame = CGRect(x: 15, y: 5, width: backView.frame.width / 2 - 15, height: labelHeight)
        titleLabel.text = self.title
        backView.addSubview(titleLabel)
        
        dateLabel.frame = CGRect(x: titleLabel.frame.maxX + 15, y: 5, width: titleLabel.frame.width - 15, height: titleLabel.frame.height)
        dateLabel.text = DataSource().getString(fromDate: date)
        backView.addSubview(dateLabel)
        
        counterLabel.frame = CGRect(x: 15, y: titleLabel.frame.maxY, width: dateLabel.frame.width, height: dateLabel.frame.height)
        counterLabel.text = self.counter
        backView.addSubview(counterLabel)
        
        chevronImage.frame = CGRect(x: backView.frame.width - 18 - 5, y: backView.frame.height / 2 - 5, width: 18, height: 18)
        backView.addSubview(chevronImage)
        
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            backView.backgroundColor = UIColor.gray
        } else {
            backView.backgroundColor = UIColor.darkGray
        }
    }
    
}















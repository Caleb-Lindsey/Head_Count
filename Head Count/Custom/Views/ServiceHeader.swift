//
//  ServiceHeader.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/11/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit
import MessageUI

class ServiceHeader : UIView, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    
    var service : Service!
    var viewController : UIViewController!

    var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = Global.headerFont
        return label
    }()
    
    var dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "Helvetica", size: 18)
        return label
    }()
    
    var counterLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "Helvetica", size: 18)
        return label
    }()
    
    var emailButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "emailButton"), for: .normal)
        button.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    var messageButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "messageButton"), for: .normal)
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        button.imageView?.layer.cornerRadius = 10
        button.layer.cornerRadius = 8
        return button
    }()
    
    var totalLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "DINCondensed-Bold", size: 25)
        return label
    }()
    
    init(frame: CGRect, service: Service, controller: UIViewController) {
        super.init(frame: frame)
        self.service = service
        self.viewController = controller
        self.backgroundColor = Global.grayColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        // Place Title Label
        titleLabel.frame = CGRect(x: 15, y: 15, width: self.frame.width - 30, height: self.frame.height / 4)
        titleLabel.text = service.title
        self.addSubview(titleLabel)
        
        // Place Counter Label
        counterLabel.frame = CGRect(x: 15, y: titleLabel.frame.maxY, width: self.frame.width / 2 - 15, height: titleLabel.frame.height / 2)
        counterLabel.text = service.counter
        self.addSubview(counterLabel)
        
        // Place Date Label
        dateLabel.frame = CGRect(x: 15, y: counterLabel.frame.maxY, width: counterLabel.frame.width, height: counterLabel.frame.height)
        dateLabel.text = DataSource().getString(fromDate: service.date)
        self.addSubview(dateLabel)
        
        // Place Email Button
        emailButton.frame = CGRect(x: self.frame.width - 50 - 5, y: self.frame.height - 50 - 5, width: 50, height: 50)
        self.addSubview(emailButton)
        
        // Place Message Button
        messageButton.frame = CGRect(x: emailButton.frame.origin.x - 50 - 5, y: emailButton.frame.origin.y, width: 50, height: 50)
        self.addSubview(messageButton)
        
        // Place Total Label
        totalLabel.frame = CGRect(x: 15, y: self.frame.height - 50, width: self.frame.width / 4, height: 50)
        totalLabel.text = "Total: \(self.service.getTotal())"
        self.addSubview(totalLabel)
        
    }
    
    @objc func sendMessage() {
        
        if (MFMessageComposeViewController.canSendText()) {
            
            let controller = MFMessageComposeViewController()
            controller.body = self.service.formatForDelivery()
            controller.subject = titleLabel.text
            controller.recipients = []
            controller.messageComposeDelegate = self
            viewController.present(controller, animated: true, completion: nil)
            
        }
    }
    
    @objc func sendEmail() {
        
        let mailController : MFMailComposeViewController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setSubject("Count: \(titleLabel.text!)")
        mailController.setMessageBody(self.service.formatForDelivery(), isHTML: false)
        
        self.viewController.present(mailController, animated: true, completion: nil)
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}

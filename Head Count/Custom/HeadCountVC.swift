//
//  HeadCountVC.swift
//  Head Count
//
//  Created by Caleb Lindsey on 2/11/18.
//  Copyright © 2018 KlubCo. All rights reserved.
//

import UIKit

class HeadCountVC : UIViewController {
    
    let backgroundImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "blueBlur")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Global.grayColor
        
        // Place Background Image
        backgroundImage.frame = view.frame
        //self.view.addSubview(backgroundImage)
        
    }
    
}

//
//  SendEmailVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 5/22/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class SendEmailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabe: UILabel!
    
    
    var emailDelegate: EmailTitleAndDetail? = nil
    
    
    @IBOutlet weak var sendEmailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sendEmailButton.layer.cornerRadius = 10
        
    }
    
    //actually send the email
    @IBAction func sendEmailPressed(_ sender: Any) {
        emailDelegate?.sendEmailVCTitleAndDetail("\()", "\()")
        
    }
    
    

}

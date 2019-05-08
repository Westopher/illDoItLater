//
//  EditVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 5/7/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class EditVC: UIViewController {

    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editDetails: UITextView!
    
    @IBOutlet weak var finishEditingButtonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.finishEditingButtonPressed.layer.cornerRadius = 10
    }
    
    

   

}

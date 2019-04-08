//
//  AddItemVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/5/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField?
    @IBOutlet weak var addButtonStyle: UIButton!
    
  
    
    @IBAction func addButtonPressed(_ sender: Any) {
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addButtonStyle.layer.cornerRadius = 10
    }
    

    

}

//
//  ViewToDoListItemVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/8/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class ViewToDoListItemVC: UIViewController {

    @IBOutlet weak var titleLabelViewItem: UILabel!
    @IBOutlet weak var emailToYourselfButton: UIButton!
    @IBOutlet weak var editItemButton: UIButton!
    
    
    var titleToDisplay: String?
    var descriptionToDisplay: String?
    
    @IBOutlet weak var titleItemLabel: UILabel!
    @IBOutlet weak var descriptionItemLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleItemLabel.text = titleToDisplay
        descriptionItemLabel.text = descriptionToDisplay
        
        self.titleLabelViewItem.layer.cornerRadius = 10
        self.emailToYourselfButton.layer.cornerRadius = 10
        self.editItemButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "editSegue", sender: Any?.self)
    }
    
    

}

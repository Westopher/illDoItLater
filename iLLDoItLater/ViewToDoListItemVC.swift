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

    var titleToDisplay: String!
    var descriptionToDisplay: String!
    
    @IBOutlet weak var titleItemLabel: UILabel!
    @IBOutlet weak var descriptionItemLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleItemLabel.text = titleToDisplay
        descriptionItemLabel.text = descriptionToDisplay
    }
    

}

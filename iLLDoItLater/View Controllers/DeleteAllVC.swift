//
//  DeleteAllVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 5/6/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class DeleteAllVC: UIViewController {

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var titleLabelInDeleteVC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.deleteButton.layer.cornerRadius = 10
        self.titleLabelInDeleteVC.layer.cornerRadius = 10
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
        print("delete button pressed")
        
    }
    
    
    
    

  

}

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
        
        let alertController = UIAlertController(title: "List Deleted", message: "Return To Home Screen", preferredStyle: .alert)
        let backToHome = UIAlertAction(title: "Return To Home Screen", style: .cancel, handler: { action in self.performSegue(withIdentifier: "backToHome", sender: self)})
        alertController.addAction(backToHome)
        self.present(alertController, animated: true, completion: nil)
        
        print("delete button pressed")
        
    }

}

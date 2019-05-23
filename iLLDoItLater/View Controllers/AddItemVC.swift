//
//  AddItemVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/5/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class AddItemVC: UIViewController {
    
    @IBOutlet weak var titleLabelAddItem: UILabel!
    var ToDoListItemsVC = ViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField?
    @IBOutlet weak var addButtonStyle: UIButton!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        //create to do object and set its properties
        let toDoRealmObject = ToDoObject()
        
        if toDoRealmObject.title == toDoRealmObject.title {
                toDoRealmObject.title = titleTextField!.text ?? "no title text"
            } else {
                print("no text for title")
        }
        
            if toDoRealmObject.details == toDoRealmObject.details {
                toDoRealmObject.details = descriptionTextField!.text ?? "no detail text"
            } else {
                print("no text for details")
        }
        
        print(toDoRealmObject.primeKey)
        //reference the realm file then write the object to the realm file
        let realm = try! Realm()
        try! realm.write {
            realm.add(toDoRealmObject, update: true)
        }
        
        self.addItemToTopOfList(toDoRealmObject)
        
        //alert user that item was added and send them back to home screen
        let alertController = UIAlertController(title: "Item Added", message: "Return To Home Screen", preferredStyle: .alert)
        let backToHome = UIAlertAction(title: "Continue", style: .cancel, handler: { action in self.performSegue(withIdentifier: "addedBackToHome", sender: self)})
        alertController.addAction(backToHome)
        self.present(alertController, animated: true, completion: nil)
        
        print("add button pressed")
        
    }
    
    func addItemToTopOfList(_ toDoRealmObject: ToDoObject) {
        let index = 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addButtonStyle.layer.cornerRadius = 10
        self.titleLabelAddItem.layer.cornerRadius = 10
        self.hideKeyboard()
    }

}

extension AddItemVC {
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(AddItemVC.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

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

    var ToDoListItemsVC = ViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField?
    @IBOutlet weak var addButtonStyle: UIButton!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let toDoRealmObject = ToDoObject()
        
        toDoRealmObject.title = titleTextField?.text
        toDoRealmObject.description = descriptionTextField?.text
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(ToDoObject)
        }
        
        let NewToDoItem = ToDoObject(title: "\(titleTextField?.text ?? "No title added")", description: "\(descriptionTextField?.text ?? "No description added")")
        ToDoListItemsVC.toDosArray.append(NewToDoItem)
        ToDoListItemsVC.tableview.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addButtonStyle.layer.cornerRadius = 10
    }

}

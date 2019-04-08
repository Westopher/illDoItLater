//
//  AddItemVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/5/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {

    var ToDoListItemsVC = ViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField?
    @IBOutlet weak var addButtonStyle: UIButton!
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
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

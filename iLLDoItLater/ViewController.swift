//
//  ViewController.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/5/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var toDosArray: [ToDoObject] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.layer.cornerRadius = 10
        toDosArray = createToDos()
    }

    func createToDos() -> [ToDoObject] {
        var firstItem = ToDoObject(title: "first item", description: "this is this first to do list item")
        var seconditem = ToDoObject(title: "second item", description: "second item")

        return [firstItem, seconditem]
    }
    

}

    extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let toDo = toDosArray[indexPath.row]
        
        cell.textLabel?.text = toDo.title
        
        return cell
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //if the user taps on the plus sign in the upper right to add a new list item
            if segue.identifier == "AddNewSegue" {
                let addVC = segue.destination as! AddItemVC
                addVC.ToDoListItemsVC = self
            }
            //if the user taps on a li
            if segue.identifier == "DetailSegue" {
                if let ViewItemVC = segue.destination as? ViewToDoListItemVC, let ip = tableview.indexPathForSelectedRow {
                   // ViewItemVC.titleToDisplay = toDosArray.title[ip.row]
                }
            }
            
        }
    
}

    extension ViewController: UITableViewDelegate {
    
}

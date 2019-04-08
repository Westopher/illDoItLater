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
            let addVC = segue.destination as! AddItemVC
            addVC.ToDoListItemsVC = self
        }
    
}

    extension ViewController: UITableViewDelegate {
    
}

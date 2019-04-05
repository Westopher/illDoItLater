//
//  ViewController.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/5/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var toDos: [ToDo] = []
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.layer.cornerRadius = 10
        toDos = createToDos()
    }

    func createToDos() -> [ToDo] {
        var firstItem = ToDo(title: "first item", description: "this is this first to do list item")
        var seconditem = ToDo(title: "second item", description: "second item")
        
        return [firstItem, seconditem]
    }
    
    
    
    
    

}

    extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let toDo = toDos[indexPath.row]
        
        cell.textLabel?.text = toDo.title
        
        return cell
    }
    
    
}

    extension ViewController: UITableViewDelegate {
    
}

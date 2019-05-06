//
//  ViewController.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/5/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    //making a variable that is an empty array of type todoobject so that you can put your list somewhere.
    var toDosArray:Results<ToDoObject>?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.layer.cornerRadius = 10
        getListItemsFromRealm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    
    func getListItemsFromRealm() {
        let realm = try! Realm()
        toDosArray = realm.objects(ToDoObject.self)
        
        tableview.reloadData()
    }
    
    

}

    extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosArray == nil ? 0: toDosArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if toDosArray != nil {
            cell.textLabel?.text = toDosArray?[indexPath.row].title
        }
        return cell
    }
    
        
        
        
        
        
        
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //if the user taps on the plus sign in the upper right to add a new list item, send them to the add item view
            if segue.identifier == "AddNewSegue" {
                let addVC = segue.destination as! AddItemVC
                addVC.ToDoListItemsVC = self
            }
        }
    }

//            //if the user taps on a list item, this sets the next page's labels
//            if segue.identifier == "DetailSegue" {
//                if let ViewItemVC = segue.destination as? ViewToDoListItemVC,
//                    let ip = tableview.indexPathForSelectedRow {
//                    ViewItemVC.titleToDisplay = "\(toDosArray?[ip.row].title)"
//                    ViewItemVC.descriptionToDisplay = "\(toDosArray?[ip.row].description)"
//                }
//            }


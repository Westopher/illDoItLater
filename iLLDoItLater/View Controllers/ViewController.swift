//
//  ViewController.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/5/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UpdateDataDelegate {
    
    func updatedData(_ title: String, _ description: String, _ primeKeyHolder: String) {
        print(self.description, "received \(title) and \(description), \(primeKeyHolder)")
        
        var updatedRealmObject = ToDoObject()
        updatedRealmObject.title = title
        updatedRealmObject.details = description
        updatedRealmObject.primeKey = primeKeyHolder
        
        let realm = try! Realm()
        try! realm.write {
            realm.create(ToDoObject.self, value: ["title": updatedRealmObject.title, "details": updatedRealmObject.details, "primeKey": updatedRealmObject.primeKey], update: true)
        }
    
        tableview.reloadData()
        print(toDosArray)
    }

    //making a variable that is an empty array of type todoobject so that you can put your list somewhere.
    var toDosArray:Results<ToDoObject>?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
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
    //if user taps on the plus sign in the upper right to add a new list item, send them to the add item view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewSegue" {
            let addVC = segue.destination as! AddItemVC
            addVC.ToDoListItemsVC = self
        }
        
        //if the user taps on a list item, this sets the next page's labels
        if segue.identifier == "DetailSegue" {
            if let ViewItemVC = segue.destination as? ViewToDoListItemVC, let ip = tableview.indexPathForSelectedRow, let toDos = toDosArray {
                ViewItemVC.delegate = self
                ViewItemVC.titleToDisplay = toDos[ip.row].title
                ViewItemVC.descriptionToDisplay = toDos[ip.row].details
                ViewItemVC.primeKey = toDos[ip.row].primeKey
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosArray == nil ? 0: toDosArray!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if toDosArray != nil {
            cell.textLabel?.text = toDosArray?[indexPath.row].title
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didselectrow: \(indexPath)")
        performSegue(withIdentifier: "DetailSegue", sender: nil)
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete  {
            if let item = toDosArray?[indexPath.row] {
                let realm = try! Realm()
                try! realm.write {
                    realm.delete(item)
                }
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
        
            }
    }
}
}


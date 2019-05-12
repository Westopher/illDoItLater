//
//  ToDoModel.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/5/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoObject: Object {
    @objc dynamic var title = ""
    @objc dynamic var details = ""
    @objc dynamic var primeKey = UUID().uuidString
    
    //if you want to search by some identifier to group the results
    override static func indexedProperties() -> [String] {
       return ["title"]
    }
    
    //a unique identifier
    override static func primaryKey() -> String {
        return "primeKey"
    }
}

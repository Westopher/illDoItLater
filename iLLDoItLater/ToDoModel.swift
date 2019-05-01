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
    @objc dynamic var title: String
    @objc dynamic var description: String
    
    convenience init(title: String, description: String) {
        self.init()
        self.title = title
        self.description = description
    }
    
    override static func indexedProperties() -> String {
       return ["title"]
    }
}

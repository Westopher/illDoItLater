//
//  ViewToDoListItemVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/8/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

protocol UpdateDataDelegate {
    func updatedData(_ title: String, _ description: String, _ myprimeKeyHolder: String)
}

class ViewToDoListItemVC: UIViewController {
    
    @IBOutlet weak var titleLabelViewItem: UILabel!
    @IBOutlet weak var emailToYourselfButton: UIButton!
    @IBOutlet weak var editItemButton: UIButton!
    
   
    @IBOutlet weak var displayTitle: UITextField!
    @IBOutlet weak var displayDescription: UITextView!
    
    var titleToDisplay: String?
    var descriptionToDisplay: String?
    
    var delegate: UpdateDataDelegate?
    
    var primeKey:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTitle.text = "\(titleToDisplay)"
        displayDescription.text = "\(descriptionToDisplay)"
        
        self.titleLabelViewItem.layer.cornerRadius = 10
        self.emailToYourselfButton.layer.cornerRadius = 10
        self.editItemButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        guard let myTitle = self.displayTitle.text, let description = self.displayDescription.text  else {
                    return
                }
        
        print("about to call delegate method with \(myTitle), \(description), \(primeKey)")
        self.delegate?.updatedData(myTitle, description, primeKey ?? "no prime key")
    }
    
    

}

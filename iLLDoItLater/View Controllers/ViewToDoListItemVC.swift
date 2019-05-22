//
//  ViewToDoListItemVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/8/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

//Update button pressed protocol
protocol UpdateDataDelegate {
    func updatedData(_ title: String, _ description: String, _ myprimeKeyHolder: String)
}

//Email button pressed protocol
protocol EmailTitleAndDetailDelegate {
    func sendEmailVCTitleAndDetail(_ title: String, _ detail: String, myprimeKeyHolder: String)
}

class ViewToDoListItemVC: UIViewController {
   
    //delegate declarations
    var delegate: UpdateDataDelegate?
    var emailDelegate: EmailTitleAndDetailDelegate?
    
    @IBOutlet weak var titleLabelViewItem: UILabel!
    @IBOutlet weak var emailToYourselfButton: UIButton!
    @IBOutlet weak var editItemButton: UIButton!
    
    @IBOutlet weak var displayTitle: UITextField!
    @IBOutlet weak var displayDescription: UITextView!
    
    var titleToDisplay: String?
    var descriptionToDisplay: String?
    
    var primeKey:String?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTitle.text = "\(titleToDisplay ?? "No Title To Display")"
        displayDescription.text = "\(descriptionToDisplay ?? "No Description To Display")"
        
        self.titleLabelViewItem.layer.cornerRadius = 10
        self.emailToYourselfButton.layer.cornerRadius = 10
        self.editItemButton.layer.cornerRadius = 10
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        guard let myTitle = self.displayTitle.text, let description = self.displayDescription.text else {return}
        print("about to call EDIT delegate method with \(myTitle), \(description), \(primeKey)")
        self.delegate?.updatedData(myTitle, description, primeKey ?? "no prime key")
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "emailSegue" {
            guard let sendEmailVC = segue.destination as? SendEmailVC else {return}
            sendEmailVC.emailDelegate = self
        }
    }
    
    @IBAction func emailButtonPressed(_ sender: Any) {
        self.navigationController?.pushViewController(SendEmailVC, animated: true)
        guard let emailTitle = self.displayTitle.text, let emailDescription = self.displayDescription.text  else {return}
        print("about to call EMAIL delegate method with \(myTitle), \(description), \(primeKey)")
        //self.emailDelegate?.sendEmailVCTitleAndDetail(emailTitle, emailDetail, myprimeKeyHolder)
    }
    

}

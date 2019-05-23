//
//  ViewToDoListItemVC.swift
//  iLLDoItLater
//
//  Created by West Kraemer on 4/8/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift
import MessageUI

//Update button pressed protocol
protocol UpdateDataDelegate {
    func updatedData(_ title: String, _ description: String, _ myprimeKeyHolder: String)
}


class ViewToDoListItemVC: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
   
    //delegate declaration
    var delegate: UpdateDataDelegate?
    // OLD VERSION DELEGATE    var emailDelegate: EmailTitleAndDetailDelegate?
    
    @IBOutlet weak var titleLabelViewItem: UILabel!
    @IBOutlet weak var emailToYourselfButton: UIButton!
    @IBOutlet weak var editItemButton: UIButton!
    
    @IBOutlet weak var enterEmail: UITextField!
    
    @IBOutlet weak var displayTitle: UITextField!
    @IBOutlet weak var displayDescription: UITextField!
    
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
        
        self.hideKeyboard()
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        guard let myTitle = self.displayTitle.text, let description = self.displayDescription.text else {return}
        print("about to call EDIT delegate method with \(myTitle), \(description), \(primeKey)")
        self.delegate?.updatedData(myTitle, description, primeKey ?? "no prime key")
    }
    

    @IBAction func emailButtonPressed(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {
            print("this device can not send mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        var emailText = enterEmail.text
        guard let sendEmailSubject = displayTitle.text, let sendEmailDescription = displayDescription.text else {return}
        
        
        mailComposer.setToRecipients(["\(emailText ?? "Enter Email Address")"])
        mailComposer.setSubject("\(sendEmailSubject)")
        mailComposer.setMessageBody("I'LL DO IT LATER... okay, now is later. Here is your reminder: \n\nTitle: \(sendEmailSubject) \nDescription: \(sendEmailDescription)", isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller:
        MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
        
//        performSegue(withIdentifier: "emailSegue", sender: sender)
//        guard let emailTitle = self.displayTitle.text, let emailDetail = self.displayDescription.text else {return}
//        print("about to call EMAIL delegate method with \(emailTitle), \(emailDetail)")
//        self.emailDelegate?.sendEmailVCTitleAndDetail(emailTitle, emailDetail)
    }
    

extension ViewToDoListItemVC {
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(AddItemVC.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

//
//  AddEventViewController.swift
//  Events
//
//  Created by Yanet Leon on 1/29/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import CoreData

class AddEventViewController: UIViewController {
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var itemNotes: UITextField!
    @IBOutlet weak var itemDate: UIDatePicker!
    
    var delegate: AddEventViewControllerDelegate?
    var indexPath: IndexPath?
    var event: Item?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (event != nil) {
            itemTitle.text = event?.title
            itemNotes.text = event?.note
            itemDate.date = (event?.deadline)!
        }
        
        self.hideKeyboardWhenTappedAround()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let item = itemTitle.text
        let notes = itemNotes.text
        let duedate = itemDate.date
        let done = false
        
        print("Inside saveButtonPressed")
        
        delegate?.dismissButtonPressed(by: self)
        delegate?.getitemDetails(item: item!, notes: notes!, duedate: duedate, done: done, event: event, at: indexPath)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
         delegate?.dismissButtonPressed(by: self)
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.dismissButtonPressed(by: self)

    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

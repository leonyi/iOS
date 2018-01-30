//
//  AddItemViewController.swift
//  BeastLists
//
//  Created by Yanet Leon on 1/30/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet weak var itemLabel: UILabel!
    
    
    var delegate: AddItemViewControllerDelegate?
    
    var indexPath: IndexPath?
    var todoitem: Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (todoitem != nil) {
            itemLabel.text = todoitem?.title
        }
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.dismissButtonPressed(by: self)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        let item = itemLabel.text
        let done = false
        
        delegate?.getitemDetails(item: item!, done: done, todoitem: todoitem, at: indexPath)
        
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

//
//  AddItemViewController.swift
//  TodoList2
//
//  Created by Yanet Leon on 1/23/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var itemNotes: UITextView!
    @IBOutlet weak var itemdueDate: UIDatePicker!
    
    var item: String? = ""
    var notes: String? = ""
    var duedate: Date = Date()
    var done: Bool = false
    
    var delegate: AddItemViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        let item = itemTitle.text
        let notes = itemNotes.text
        let duedate = itemdueDate.date
        let done = false
//
//        print("Item: \(String(describing: item))")
//        print("Notes: \(String(describing: notes))")
//        print("DueDate: \(String(describing: duedate))")
//        print("Done: \(String(describing: done))")

        delegate?.submitButtonPressed(by: self)
        delegate?.getitemDetails(item: item!, notes: notes!, duedate: duedate, done: done)

    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    

}

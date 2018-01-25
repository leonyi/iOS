//
//  addItemViewController.swift
//  TodoList
//
//  Created by Yanet Leon on 1/22/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class addItemViewController: UIViewController, ToDoListViewControllerDelegate {
 
    @IBOutlet weak var itemLabel: UITextField!
    @IBOutlet weak var itemNote: UITextField!
    @IBOutlet weak var itemDueDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        // Perform the segue
        performSegue(withIdentifier: "toTodoItems", sender: self)
        
    }
    
    // MARK: - Navigation

    // Prepare the segue going through the NavigationController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTodoItems" {
            let navigationVC = segue.destination as! UINavigationController
            let todoListVC = navigationVC.topViewController as! ToDoListViewController
            // Send the data over to the ToDoListViewController
            todoListVC.itemTitle = itemLabel.text!
            todoListVC.itemNote = itemNote.text!
            // How do we set this to datePicker.minimumDate = [NSDate date] via the UI?
            todoListVC.itemdueDate = itemDueDate.date
            // Declare self as the delegate of UITableViewController
            todoListVC.delegate = self
            
        }

    }
    
    // MARK: - Delegate function
    func addButtonPressed(by controller: ToDoListViewController ){
        print("dimiss triggered!")
        dismiss(animated: true, completion: nil)
        clearLabels()
        
    }
    
    func clearLabels() {
        itemLabel.text = ""
        itemNote.text = ""
    }

}

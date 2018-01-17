//
//  ViewController.swift
//  beastList
//
//  Created by Yanet Leon on 1/12/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import Foundation

// To delete an item from the list, we declare that the ViewController conforms to the UITableViewDelegate protocol.
class ViewController: UIViewController {

    // Sample array to hold our Model objects.
    var tasks = ["Learn Swift", "Become an iOS Dev Ninja", "Build super cool iOS apps as a hobby"]
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if !(taskTextField.text?.isEmpty)! {
            if tasks.contains(taskTextField.text!){
                print(taskTextField.text! + "Already in database!")
            } else {
                tasks.append(taskTextField.text!)
            }
        }
        
        tableView.reloadData()
        taskTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set UITableView's dataSource to self (ViewController) the questions in the extension!
        tableView.dataSource = self
        tableView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// What data should I display? We will use our sample array data to play here.
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count
    }
    
    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        // Show number that the row is...
        // To do this, go over in the view, create a prototype cell.
        // 1. Click on Table View and on the Table View menu (right side) select 1 as the prototype cell.
        // 2. A prototype cell is added to the View, click on it and on the right menu add an identifier.  Now let's use that identifier as the String.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        // Change text of cell to get the value for each index in the tasks array.
        cell.textLabel?.text = tasks[indexPath.row]
        
        // Return the cesll so that TableView knows what to render in each row.
        return cell
    }
    
}

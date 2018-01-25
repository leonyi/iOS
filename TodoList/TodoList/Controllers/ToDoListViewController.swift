//
//  ToDoListViewController.swift
//  TodoList
//
//  Created by Yanet Leon on 1/22/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {
    // Sends us back to the addItemViewController
    weak var delegate: ToDoListViewControllerDelegate?
    
    // Preparing for data from addItemViewController
    var itemTitle = ""
    var itemNote = ""
    var itemdueDate: Date  = NSDate.distantFuture
    
    // Initializing the items array
    var itemArray = [Item] ()
    
    // Path to where the data is being stored for the current app.  Keeping this just for learning purposes.
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    // Using the shared singleton object to access the AppDelegate object and access the container where we will be saving our data.
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add new items to the itemArray
        let newItem = Item(context: self.context)
        newItem.title = itemTitle
        newItem.note = itemNote
        newItem.deadline = itemdueDate
        newItem.done = false
        
        self.itemArray.append(newItem)
        
        // Let's persist the data
       self.saveItems()
        print("Item title: \(itemTitle)")
        print("Item note: \(itemNote)")
        print("Item due date: \(itemdueDate)")
        
        // Load items to display
        loadItems()
        
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        print("addButtonPressed function triggered!")
        delegate?.addButtonPressed(by: self)
    }
    

    //MARK: - TableView DataSource Methods
    
    // How many cells are we going to need?
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemArray.count
    }
    
    // How should I create each cell?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.textLabel?.text = item.note
        
        // How do I get the date out?
        //cell.Date
        
        // Set the accessory to the opposite of what is set.
        cell.accessoryType = item.done ? .checkmark : .none
    
        return cell
    }
    
    //MARK: - TableView Delegate Methods: checkmark and cell selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If the row is selected and if it has a checkmark/or not set it to the opposite of what it was. :)
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // Save the updates
        // saveItems
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Model Manipulation Methods
    func saveItems () {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
        self.tableView.reloadData()
    }

}


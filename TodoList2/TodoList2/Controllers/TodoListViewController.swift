//
//  TodoListViewController.swift
//  TodoList2
//
//  Created by Yanet Leon on 1/23/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import CoreData


class TodoListViewController: UITableViewController, AddItemViewControllerDelegate {
    // Initializing the items array
    var itemArray = [Item]()
    
    // Path to where the data is being stored for the current app.  Keeping this to find the backend SQLite DB.
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    // Using the shared singleton object to access the AppDelegate object and access the container where we will be saving our data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddItem"{
            let navigationVC = segue.destination as! UINavigationController
            let addItemVC = navigationVC.topViewController as! AddItemViewController
            addItemVC.delegate = self
        }
    }
    
    
    //MARK: - TableView DataSource Methods
    
    // How many rows are we going to need?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // How should we configure each cell?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath) as! CustomCell
        let item = itemArray[indexPath.row]
        
        // Formatting the date for display on the desired format.
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MM/dd/yy"
        let itemDueDate = dateFormatter.string(from: item.deadline!)

        // Add items
        cell.itemTitle?.text = item.title
        cell.itemDate?.text = itemDueDate
        cell.itemNote?.text = item.note
        
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .detailDisclosureButton : .none
        
        return cell
    }
 
    // MARK: - TableView Delegate Methods: checkmark & cell selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If the row is selected and if it has a checkmark/or not set it to the opposite of what it was. :)
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // Save the updates
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 100
    }
    
    //MARK: - Delegate Functions
    // Add New Items
    func getitemDetails(item: String, notes: String, duedate: Date, done: Bool) {
        let newItem = Item(context: self.context)
        newItem.title = item
        newItem.note = notes
        newItem.deadline = duedate
        newItem.done = done
        
        self.itemArray.append(newItem)
       
        self.saveItems()
    }
    
    func submitButtonPressed(by controller: AddItemViewController){
        dismiss(animated: true, completion: nil)
    }

    func cancelButtonPressed(by controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Delete Items
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        context.delete(itemArray[indexPath.row])
        itemArray.remove(at: indexPath.row)
  
        self.saveItems()
        tableView.reloadData()
    }
    
    // MARK: - Model Manipulation Methods
    func saveItems () {
        
        do {
            // This commits the changes to our persistent store.
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        // Refresh the view
        self.tableView.reloadData()
    }
    

    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil ){
        do {
            itemArray =  try context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
        print("Size of itemArray: \(itemArray.count)")
        self.tableView.reloadData()
    }

}

// ToDo: Add placeholder to TextView.
//extension TodoListViewController:  UITextViewDelegate {
//    let textView = UITextViewDelegate
//}


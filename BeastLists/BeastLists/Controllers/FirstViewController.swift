//
//  FirstViewController.swift
//  BeastLists
//
//  Created by Yanet Leon on 1/30/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UITableViewController, AddItemViewControllerDelegate {
    // Initializing the items array
    var itemArray = [Item]()
    
    // Using the shared singleton object to access the AppDelegate object and access the container where we will be saving our data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Segue functions
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddItem"{
            let navigationVC = segue.destination as! UINavigationController
            let addItemVC = navigationVC.topViewController as! AddItemViewController
            addItemVC.delegate = self as? AddItemViewControllerDelegate
        }
    }
    
    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        let item = itemArray[indexPath.row]
        
        // Populate custom cell items.
        cell.todoItem.text = item.title
        cell.beastButton.isHidden = false
        
        return cell
    }
    

    
    // MARK: - Data Manipulation Functions
    // Delete Items
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        context.delete(itemArray[indexPath.row])
        itemArray.remove(at: indexPath.row)
        
        self.saveItems()
        tableView.reloadData()
    }
    
    
    // Load Items
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil ){
        do {
            itemArray =  try context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
        print("Size of itemArray: \(itemArray.count)")
        self.tableView.reloadData()
    }
    
    
    // Save Items
    func saveItems () {
        
        do {
            // This commits the changes to our persistent store.
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        // Refresh the view
        print("SaveItems: Reloading tableView data by calling loadItems()!")
        loadItems()
        
    }


}


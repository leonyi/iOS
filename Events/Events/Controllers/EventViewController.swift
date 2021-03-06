//
//  EventViewControllerViewController.swift
//  Events
//
//  Created by Yanet Leon on 1/29/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import CoreData

class EventViewController: UITableViewController, AddEventViewControllerDelegate, CustomCellDelegate {
    // Initializing the new item array
    let sectionsArray = ["Incomplete", "Complete"]
    var incompleteArray = [Item]()
    var completeArray = [Item]()
    
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
    
    // MARK: - Segue Information
    // Preparing the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationVC = segue.destination as! UINavigationController
        let addItemVC = navigationVC.topViewController as! AddEventViewController
        addItemVC.delegate = self
        
        if let indexPath = sender as? IndexPath {
            let navigationVC = segue.destination as! UINavigationController
            let addItemVC = navigationVC.topViewController as! AddEventViewController
            addItemVC.delegate = self
            
            // Edit only incomplete events.
            let event = self.incompleteArray[indexPath.row]
            addItemVC.event = event
            addItemVC.indexPath = indexPath
            
        }
    }
    
    // Performing the segue
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddItemView", sender: self)
    }
    
    
    // The cell calls this method when the user taps the edit button on the custom cell.
    func customCellEditTapped(_ sender: CustomCell) {
        let indexPath = tableView.indexPath(for: sender)
        print("Edit button pressed!", sender, indexPath!)
        performSegue(withIdentifier: "toAddItemView", sender: indexPath)
    }
    
    
    // MARK: - Table Sections and Cell customization
    // Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArray.count
    }
    
    // Headers for each section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsArray[section]
    }
    
    // Header for Sections customization
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
        
    }
    
    // How many rows do we need?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numofRows = [incompleteArray.count, completeArray.count]
        
        return numofRows[section]
    }
    
    // How should we configure each cell?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.delegate = self
        
        if indexPath.section == 0 {
            if incompleteArray.count > 0 {
                let item = incompleteArray[indexPath.row]
                construnctCell(item: item, cell: cell)
            }
        } else {
            if completeArray.count > 0 {
                let item = completeArray[indexPath.row]
                construnctCell(item: item, cell: cell)
            }
        }
        
        return cell
    }
    
    
    // Populating the incomplete and complete item arrays.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            incompleteArray[indexPath.row].done = !incompleteArray[indexPath.row].done
        } else if indexPath.section == 1{
            if completeArray.count > 0 {
                completeArray[indexPath.row].done = !completeArray[indexPath.row].done
            } else {
                print("Error while selecting item.  indexPath.row: \(indexPath.row)")
            }
        }
        
        saveItems()
        // tableView.deselectRow(at: indexPath, animated: true)
        loadItems()
        
    }
    
    
    // Delete Items
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            context.delete(incompleteArray[indexPath.row])
            incompleteArray.remove(at: indexPath.row)
        } else if indexPath.section == 1 {
            context.delete(completeArray[indexPath.row])
            completeArray.remove(at: indexPath.row)
        } else {
            print ("Error deleting item!")
        }

        self.saveItems()
        self.tableView.reloadData()
    }
    
    
    // MARK: - Conform to AddEventViewControllerDelegate Protocol methods
    
    func dismissButtonPressed(by controller: AddEventViewController) {
        print("Inside dismiss button!")
        dismiss(animated: true, completion: nil)
    }
    
    func getitemDetails(item: String, notes: String, duedate: Date, done: Bool, event: Item?, at indexPath: IndexPath?) {
        
        if let ip = indexPath {
            print("Inside getitemDetails updating record!")
            // Updates an existing item.
            incompleteArray[ip.row].title = item
            incompleteArray[ip.row].note = notes
            incompleteArray[ip.row].deadline = duedate
            self.tableView.reloadData()
        } else {
            print("Inside getitemsDetails adding new record!")
            // Adds a brand new item.
            let newItem = Item(context: self.context)
            newItem.title = item
            newItem.note = notes
            newItem.deadline = duedate
            newItem.done = done
            self.incompleteArray.append(newItem)
            self.tableView.reloadData()
        }
        
        self.saveItems()
        self.tableView.reloadData()

        
    }

    // MARK: - Supporting and data manipulation methods
    func construnctCell(item: Item, cell: CustomCell) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat =  "hh:mm"
        let itemDueDate = dateFormatter.string(from: item.deadline!)
        
        // Add details to cell items
        cell.itemTitle?.text = item.title
        cell.itemTime?.text = itemDueDate
        
        // value = condition ? valueIfTrue : valueIfFalse
        // cell.accessoryType = !item.done ? .detailDisclosureButton : .none
        cell.editButton.isHidden = !item.done ? false : true
    }

    // Load Items
    func loadItems(){
        
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            // Populating the incomplete items array
            request.predicate = NSPredicate(format: "done == %@", NSNumber(value:false))
            request.sortDescriptors = [NSSortDescriptor(key: "deadline", ascending: true)]
            incompleteArray = try context.fetch(request)
            self.tableView.reloadData()
            
            // Populating the completed items array
            request.predicate = NSPredicate(format: "done == %@", NSNumber(value:true))
            request.sortDescriptors = [NSSortDescriptor(key: "deadline", ascending: true)]
            completeArray = try context.fetch(request)
            self.tableView.reloadData()
            
        } catch {
            print("Error fetching data from context: \(error)")
        }
        print("loadItems: Reloading tableView data!")
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


//
//  RefinedFetchViewController.swift
//  CurveBalls
//
//  Created by Yanet Leon on 1/25/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import CoreData

class RefinedFetchViewController: UIViewController {
    // Initialize the item array
    var itemArray = [Animal]()
    
    // Path to where the data is being stored for the current app.  Keeping this to find the backend SQLite DB.
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    // Using the shared sigleton object to access the AppDelegate to gain access to the container where we will be
    // performing CRUD operations.
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataFilePath)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Ran only once to populate the DB.
        // addItems()
        // saveItems()
        loadItems()
    }
    
    // MARK: - Model Manipulation Methods
    func addItems () {
        let animal1 = Animal(context: self.context)
        animal1.kind = "chamaleon"
        animal1.family = "reptile"
        
        let animal2 = Animal(context: self.context)
        animal2.kind = "cocodrile"
        animal2.family = "reptile"
        
        let animal3 = Animal(context: self.context)
        animal3.kind = "hawksbill turtle"
        animal3.family = "reptile"
        
        let animal4 = Animal(context: self.context)
        animal4.kind = "python"
        animal4.family = "reptile"
        
        let animal5 = Animal(context: self.context)
        animal5.kind = "iguana"
        animal5.family = "reptile"
        
        let animal6 = Animal(context: self.context)
        animal6.kind = "dolphin"
        animal6.family = "mammal"
        
        let animal7 = Animal(context: self.context)
        animal7.kind = "fox"
        animal7.family = "mammal"
        
        let animal8 = Animal(context: self.context)
        animal8.kind = "otter"
        animal8.family = "mammal"
        
        let animal9 = Animal(context: self.context)
        animal9.kind = "panda"
        animal9.family = "mammal"
        
        let animal10 = Animal(context: self.context)
        animal10.kind = "fox"
        animal10.family = "mammal"
        
        itemArray.append(animal1)
        itemArray.append(animal2)
        itemArray.append(animal3)
        itemArray.append(animal4)
        itemArray.append(animal5)
        itemArray.append(animal6)
        itemArray.append(animal7)
        itemArray.append(animal8)
        itemArray.append(animal9)
        itemArray.append(animal10)
        
        print("Array size: \(itemArray.count)")
    }
    
    @IBAction func showAllAnimallsButtonPressed(_ sender: UIButton) {
        loadItems()
    }
    
    @IBAction func showOnlyReptilesButtonPressed(_ sender: UIButton) {
        updateWithSearchResults(filter: "reptile")
    }
    
    @IBAction func showOnlyMammalsButtonPressed(_ sender: UIButton) {
        updateWithSearchResults(filter: "mammal")
    }
    
}

extension RefinedFetchViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: TableView Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.kind
        
        return cell
    }
    
    func saveItems (){
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
        
    }
    
    func loadItems(with request: NSFetchRequest<Animal> = Animal.fetchRequest(), predicate: NSPredicate? = nil ) {
       
        request.predicate = predicate
        do {
            itemArray = try context.fetch(request)
            print("Array size: \(itemArray.count)")
        } catch {
            print("Error fetching data from context: \(error)")
        }
        self.tableView.reloadData()
    }
    
    func updateWithSearchResults(filter: String) {
        let request: NSFetchRequest<Animal> = Animal.fetchRequest()

        let predicate = NSPredicate(format: "family = %@", filter)
        
        request.sortDescriptors = [NSSortDescriptor(key: "family", ascending: true)]
        
        loadItems(with: request, predicate: predicate)
    }
    
}

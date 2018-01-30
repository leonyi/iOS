//
//  SectionsTableViewController.swift
//  CurveBalls
//
//  Created by Yanet Leon on 1/25/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import CoreData

class SectionsTableViewController: UITableViewController {
    // Initialize the arrays
    // var itemArray = [Quote]()
    
    let headers = ["Quote Bank", "Favorite Quotes"]
    var quotebankArray = [Quote]()
    var favoritesArray = [Quote]()
    
    // Path to where the data is being stored for the current app.  Keeping this to find the backend SQLite DB.
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    // Setup the context to access the AppDelegate and gain access ot the container
    // where we will perfrom CRUD.
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataFilePath)
        // Done once to populate DB.
        //        addItems()
        //        saveItems()
        
        loadItems()

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    // Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    
    // Header for Sections customization
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
        
    }

    
    // Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return itemArray.count
        
        let numofRows = [favoritesArray.count, quotebankArray.count]
        
        print ("Number of rows: \(numofRows)")
        
        return numofRows[section]
    }
 
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        if indexPath.section == 0 {
            if quotebankArray.count > 0 {
                let item = quotebankArray[indexPath.row]
                cell.textLabel?.text = item.content
                cell.detailTextLabel?.text = item.author
                
                print("In quote bank!")
            }
            
        } else {
            if favoritesArray.count > 0 {
                let item = favoritesArray[indexPath.row]
                cell.textLabel?.text = item.content
                cell.detailTextLabel?.text = item.author
                
                print("In favorites!")
            }
        }


        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            quotebankArray[indexPath.row].favorite = !quotebankArray[indexPath.row].favorite
        } else if indexPath.section == 1{
            // Add condition to catch when array is empty.
            favoritesArray[indexPath.row].favorite = !favoritesArray[indexPath.row].favorite
        }
        
        saveItems()
        loadItems()
        
    }
    
    // MARK: - Data Model Manipulation methods

    // func loadItems(with request: NSFetchRequest<Quote> = Quote.fetchRequest(), predicate: NSPredicate? = nil) {
    func loadItems() {

        let request: NSFetchRequest<Quote> = Quote.fetchRequest()
        
        do {
            // Populating the favorites array
            request.predicate = NSPredicate(format: "favorite == %@", NSNumber(value:true))
            favoritesArray = try context.fetch(request)
            
            print("Size of favorites: \(favoritesArray.count)")
            
            // Populating the quote bank array
            request.predicate = NSPredicate(format: "favorite == %@", NSNumber(value:false))
            quotebankArray = try context.fetch(request)
            
            print("Size of quote bank: \(quotebankArray.count)")
            
        } catch {
            print("Error fetching data from context: \(error)")
        }
        self.tableView.reloadData()
    }
    
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
        self.tableView.reloadData()
    }
    
    
    // Run only once to load items.
    func addItems() {
        let quote1 = Quote(context: self.context)
        quote1.content = "I'd rather regret the things I've done than regret the things I haven't done."
        quote1.author = "Lucille Ball"
        quote1.favorite = false
        
        let quote2 = Quote(context: self.context)
        quote2.content = "I love deadlines. I like the whooshing sound they make as they fly by."
        quote2.author = "Douglas Adams"
        quote2.favorite = false
        
        let quote3 = Quote(context: self.context)
        quote3.content = "Fettucini Alfredo is macaroni and cheese for adults."
        quote3.author = "Mitch Hedberg"
        quote3.favorite = false
        
        let quote4 = Quote(context: self.context)
        quote4.content = "The difference between successful people and others is how long they spend feeling sorry for themselves."
        quote4.author = "Barbara Corcoran"
        quote4.favorite = false
        
        let quote5 = Quote(context: self.context)
        quote5.content = "People who think they know everything are a great annoyance to those of us who do."
        quote5.author = "Isacck Asimov"
        quote5.favorite = false
        
        let quote6 = Quote(context: self.context)
        quote6.content = "Change happens by listening and then starting a dialogue with the people who are doing something you don't believe is right."
        quote6.author = "Jane Goodall"
        quote6.favorite = false
        
        let quote7 = Quote(context: self.context)
        quote7.content = "Don't compromise yourself. You are all you've got.  There is no yesterday, no tomorrow, it's all the same day."
        quote7.author = "Janis Joplin"
        quote7.favorite = false
        
        let quote8 = Quote(context: self.context)
        quote8.content = "Have you ever noticed that anybody driving slower than you is an idiot, and anyone going faster than you is a maniac."
        quote8.author = "George Carlin"
        quote8.favorite = false
        
        let quote9 = Quote(context: self.context)
        quote9.content = "The moste effective way to do it, is to do it."
        quote9.author = "Amelia Earhart"
        quote9.favorite = false
    }
    
}

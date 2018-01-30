//
//  CustomSwipeTableViewController.swift
//  CurveBalls
//
//  Created by Yanet Leon on 1/25/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class CustomSwipeTableViewController: UITableViewController {
    var herosArray = [Hero] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        let hero1 = Hero(name: "Batman", world: "Gotham City" , nemesis: "Cat Woman", selected: "", action: "")
        let hero2 = Hero(name: "Mario", world: "Yoshi's Island" , nemesis: "Bowser", selected: "", action: "")
        let hero3 = Hero(name: "Thor", world: "Asgard" , nemesis: "Loki", selected: "", action: "")
        let hero4 = Hero(name: "Maggie Simpson", world: "Springfield" , nemesis: "Unibrow Baby", selected: "", action: "")
        let hero5 = Hero(name: "Katniss Everdeen", world: "District 12" , nemesis: "President Snow", selected: "", action: "")
        
        herosArray.append(hero1)
        herosArray.append(hero2)
        herosArray.append(hero3)
        herosArray.append(hero4)
        herosArray.append(hero5)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    // How many rows do we need?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return herosArray.count
    }
    
    // How should we configure each cell?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
    
        cell.heroName?.text = herosArray[indexPath.row].name
        cell.swipeActionLable.text = herosArray[indexPath.row].selectedChoice
        
        return cell
        
    }

    // MARK: - Custom Swipe
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let world = UITableViewRowAction(style: .destructive, title: "World") { (action, indexPath) in
            self.herosArray[indexPath.row].selectedChoice = "World: " + self.herosArray[indexPath.row].world
            self.herosArray[indexPath.row].swipeAction = "world"
            tableView.reloadData()
        }
        
        let nemesis = UITableViewRowAction(style: .destructive, title: "Nemesis") { (action, indexPath) in
            self.herosArray[indexPath.row].selectedChoice = "Nemesis: " + self.herosArray[indexPath.row].nemesis
            self.herosArray[indexPath.row].swipeAction = "nemesis"
            tableView.reloadData()
            
        }
        
        let clear = UITableViewRowAction(style: .normal, title: "Clear") { (action, indexPath) in
            self.herosArray[indexPath.row].selectedChoice = ""
            self.herosArray[indexPath.row].swipeAction = "clear"
            tableView.reloadData()
        }
        
        clear.backgroundColor = UIColor.lightGray
        
        if self.herosArray[indexPath.row].swipeAction == "world" {
            return [clear, nemesis]
        } else if self.herosArray[indexPath.row].swipeAction == "nemesis" {
            return [clear, world]
        } else {
            return [world, nemesis]
        }
        
        
    }
    
}

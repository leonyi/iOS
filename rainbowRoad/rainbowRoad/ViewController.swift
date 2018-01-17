//
//  ViewController.swift
//  rainbowRoad
//
//  Created by Yanet Leon on 1/16/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let colors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // What data should I display? We will use our sample array data to play here.
    // How many cells are we going to need?
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return colors.count
        
    }
    
    // Programatically resize the height.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 120
    }

    // How should I create each cell?
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! customTableViewCell

        cell.colorLbl.backgroundColor = colors[indexPath.row]
        
        return cell
    }


}

// Notes from lecture and alternate way to approach the solution.
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//    // How many cells are we going to need?
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // return an integer that indicates how many rows (cells) to draw
//        return colors.count
//
//    // How should I create each cell?
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Get the UITableViewCell and create/populate it with data then return it
//        // Show number that the row is...
//        // To do this, go over in the view, create a prototype cell.
//        // 1. Click on Table View and on the Table View menu (right side) select 1 as the prototype cell.
//        // 2. A prototype cell is added to the View, click on it and on the right menu add an identifier.  Now let's use that identifier as the String.
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
//
//        // Change the color
//        cell.textLabel?.text = tasks[indexPath.row]
//
//        // Return the cesll so that TableView knows what to render in each row.
//        return cell
//    }
//
//}


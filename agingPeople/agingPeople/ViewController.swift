//
//  ViewController.swift
//  agingPeople
//
//  Created by Yanet Leon on 1/13/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let people = ["George", "Betty", "Fran", "Joe","Helda", "Winifred", "Zed", "Sara", "Jeffy", "Abraham", "Anna", "Melinda"]
    var age = [Int]()
    var randomnum: UInt32 = 0

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        for _ in 1...12 {
            randomnum = arc4random_uniform(UInt32(91)+5)
            age.append(Int(randomnum))
            
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
        
    }
    
    // This function is an example of programatically adjusting the height
    //  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
    //     return 100
    // }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        
        // To give the cells rounder corners:
        // cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        
        
        cell.nameLbl.text = people[indexPath.row]
        cell.randomnumLbl.text = String(age[indexPath.row]) + " years old"
        
        // If we had an image the code would look as follows:
        // cell.myImage.image = UIImage(named: array_name[IndexPath.row])
        // cell.myImage.layer.cornerRadius = cell.animalImage.frame.height / 2
        return cell
    }


}


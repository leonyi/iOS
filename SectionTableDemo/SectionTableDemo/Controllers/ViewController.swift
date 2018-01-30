//
//  ViewController.swift
//  SectionTableDemo
//
//  Created by Yanet Leon on 1/24/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let headers = ["First", "Second", "Third"]
    let tableData: [String: [String]] = [
        "First": [
            "My Son",
            "Tropical Beaches",
            "Yoga",
            "Meditation"
            
        ],
        "Second": [
            "Reading",
            "Programming",
            "My Car",
            "HIT Training"
        ],
        "Third": [
            "Snowboarding",
            "Basketball",
            "Kravmaga"
        ]
            
    ]
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:
UITableViewDataSource, UITableViewDelegate {
    // Returns the count of the number of entries in the header array.
    // This is the number of sections in the table view.
    func numberOfSections(in tableView: UITableView) -> Int {
      return headers.count
    }
    
    // Returns the lenght of the list associated with the header.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let header = headers[section]
        return tableData[header]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let header = headers [indexPath.section]
        
        cell.textLabel?.text = tableData[header]?[indexPath.row]
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
}

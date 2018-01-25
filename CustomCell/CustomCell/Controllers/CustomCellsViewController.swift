//
//  ViewController.swift
//  CustomCell
//
//  Created by Yanet Leon on 1/23/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class CustomCellsViewController: UITableViewController {
    var nums = [1, 90, 32, 23, 9, 12]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.rightLabel.text = "\(nums[indexPath.row])"
        if nums[indexPath.row] > 24 {
            cell.leftButton.backgroundColor = UIColor.green
        } else {
            cell.leftButton.backgroundColor = UIColor.red
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }

}


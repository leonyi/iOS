//
//  CustomCell.swift
//  Events
//
//  Created by Yanet Leon on 1/29/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var itemTime: UILabel!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    var delegate: CustomCellDelegate?
    
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        delegate?.customCellEditTapped(self)
    }
    
}

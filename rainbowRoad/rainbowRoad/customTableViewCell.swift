//
//  customTableViewCell.swift
//  rainbowRoad
//
//  Created by Yanet Leon on 1/16/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var colorLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

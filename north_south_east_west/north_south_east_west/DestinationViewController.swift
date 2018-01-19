//
//  DestinationViewController.swift
//  north_south_east_west
//
//  Created by Yanet Leon on 1/18/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {
    var sourceLocation: String?
    @IBOutlet weak var sourceOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the button to the proper title
        // This didn't set it!
        // sourceOutlet.titleLabel?.text = sourceLocation
        sourceOutlet.setTitle(sourceLocation, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

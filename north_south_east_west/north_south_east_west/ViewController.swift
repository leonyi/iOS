//
//  ViewController.swift
//  north_south_east_west
//
//  Created by Yanet Leon on 1/18/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier!)
        if let destinationViewController = segue.destination as? DestinationViewController {
            destinationViewController.sourceLocation = (sender as! UIButton).titleLabel?.text!
            print("Destination View Controller: ",  destinationViewController.sourceLocation! )
        }
    }

}


//
//  ViewController.swift
//  coldCall
//
//  Created by Yanet Leon on 1/10/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    let namesVault = [ "Ready?", "Courtney", "Jay", "Bryant", "Cody", "Uyanga", "Cody", "Joshua", "Ryota", "Michael", "Joshua", "Anthony"
    ]
    
    var currentName = 0
    @IBAction func coldcallButtonPressed(_ sender: UIButton) {
        print("Cold call button pressed!")
        var randomindex: UInt32
        var randomnumber: UInt32
        randomindex = arc4random_uniform(UInt32(namesVault.count))
        currentName = Int(randomindex)
        randomnumber = arc4random_uniform(UInt32(5) + 1)
        print("Random number: ", randomnumber)

        updateUI()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI () {
        nameLabel.text = namesVault[currentName]
    }


}


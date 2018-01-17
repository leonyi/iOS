//
//  ViewController.swift
//  coldCall_v2
//
//  Created by Yanet Leon on 1/10/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    let namesVault = [ "Ready?", "Courtney", "Jay", "Bryant", "Cody", "Uyanga", "Cody", "Joshua", "Ryota", "Michael", "Joshua", "Anthony"
    ]
    var randomnumberstring: String = ""
    var randomcolor: UIColor = .white
    var currentName = 0
    
    @IBAction func coldcallButtonPressed(_ sender: UIButton) {
        print("Cold call button pressed!")
        var randomindex: UInt32
        var randomnumber: UInt32 = 0
        randomindex = arc4random_uniform(UInt32(namesVault.count))
        currentName = Int(randomindex)
        randomnumber = arc4random_uniform(UInt32(5)+1)
        randomnumberstring = String(randomnumber)
        if randomnumber == 1 || randomnumber == 2 {
            randomcolor = .red
        } else if randomnumber == 3 || randomnumber == 4 {
            randomcolor = .orange
        } else {
            randomcolor = .green
        }
        print("Random number: \(randomnumber) and Color: \(randomcolor)")
        
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUI () {
        nameLabel.text = namesVault[currentName]
        numberLabel.text = randomnumberstring
        numberLabel.textColor = randomcolor
        
    }

}


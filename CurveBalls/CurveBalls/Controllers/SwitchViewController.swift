//
//  SwitchViewController.swift
//  CurveBalls
//
//  Created by Yanet Leon on 1/24/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var switchState: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchStateChanged(mySwitch: mySwitch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func switchStateChanged(mySwitch: UISwitch) {
        if mySwitch.isOn {
            switchState.text = "The switch is on!"
        } else {
            switchState.text = "The switch is off!"
        }
    }
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        switchStateChanged(mySwitch: mySwitch)
    }
    
}


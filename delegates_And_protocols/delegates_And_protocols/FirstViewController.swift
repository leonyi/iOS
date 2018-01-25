//
//  ViewController.swift
//  delegates_And_protocols
//
//  Created by Yanet Leon on 1/20/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

// Step 2 (to send data back to vc1): Conform to the CanReceive protocol.
class FirstViewController: UIViewController, CanReceive {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func changeToBlue(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }
    
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        // Sending data forward: perform the segue when the button is pressed.
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }
    
    // Sending data forward: preparing the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForwards" {
            let secondVC = segue.destination as! SecondViewController
            // Setting the secondVC data field to whatever the user set the textfield to.
            secondVC.data = textField.text!
            
            // Step 6 (to send data back to vc1): Set the secondVC delegate to self.
            secondVC.delegate = self
            
        }
    }
    
    // Step 3 (to send data back to vc1): Implement the delegate method.
    func dataReceived(data: String) {
        label.text = data
    }
}


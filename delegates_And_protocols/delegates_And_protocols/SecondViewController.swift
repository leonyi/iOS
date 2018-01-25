//
//  SecondViewController.swift
//  delegates_And_protocols
//
//  Created by Yanet Leon on 1/20/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

// Step 1 (to send data back to vc1) -  Define the protocol.
protocol CanReceive {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {
    
    // Step 4 (to send data back to vc1): Define the delegate.
    var delegate: CanReceive?
    
    var data = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the label property to whatever we have on data.
        label.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Step 5 (send data back to vc1): If the delegate is nil then the data isn't sent.
    // Else, if the delegate is not nil send the data (in text field) back.
    @IBAction func sendDataBack(_ sender: Any) {
        delegate?.dataReceived(data: text.text!)
        // Dismiss the second UI after the text is sent/button pressed.
        dismiss(animated: true, completion: nil)
    }
    
}

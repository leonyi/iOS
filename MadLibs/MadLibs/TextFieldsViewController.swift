//
//  TextFieldsViewController.swift
//  MadLibs
//
//  Created by Yanet Leon on 1/18/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

// Should this be in a separate delegate file?
protocol  TextFieldsViewControllerDelegate {
    func sendmadLib(madlibString: String)
    func submitButtonPressed(by controller: TextFieldsViewController)
}

class TextFieldsViewController: UIViewController {
    var madLibString: String = ""
    var delegate: TextFieldsViewControllerDelegate?
    
    @IBOutlet weak var adjectiveField: UITextField!
    @IBOutlet weak var verbField: UITextField!
    @IBOutlet weak var nounField: UITextField!
    @IBOutlet weak var verb2Field: UITextField!
    
    func generateMadLib(text1: String, text2: String, text3: String, text4: String) -> String {
         madLibString = "We are having a \(text1) time now. Later we will \(text2) and \(text3) in the \(text4)."
    
        return madLibString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let adj = adjectiveField.text
        let verb1 = verbField.text
        let noun = nounField.text
        let verb2 = verb2Field.text
        
        let madlibString = generateMadLib(text1: adj!, text2: verb1!, text3: noun!, text4: verb2!)
    
        performSegue(withIdentifier: "unwindToMainViewController", sender: self)
        delegate?.sendmadLib(madlibString: madlibString )
        delegate?.submitButtonPressed(by: self)
    }
    

}

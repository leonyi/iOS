//
//  ViewController.swift
//  MadLibs
//
//  Created by Yanet Leon on 1/18/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TextFieldsViewControllerDelegate {
    var initialText: String = "..."

    
    @IBOutlet weak var madLibsPhrase: UITextView!
    
    func isTextViewEmpty(textView: UITextView) -> Bool {
        guard let text = textView.text,
            !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
                return true
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // If the textView is empty set it to the initial value.
        if isTextViewEmpty(textView: madLibsPhrase) {
            madLibsPhrase.text = initialText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? TextFieldsViewController {
            destination.delegate = self
        }
    }
    
    func submitButtonPressed(by controller: TextFieldsViewController) {
        dismiss(animated: true, completion: nil)
    }
    func sendmadLib(madlibString: String){
        print("madlibString")
        madLibsPhrase.text = madlibString
    }

}


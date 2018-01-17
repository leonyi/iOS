//
//  ViewController.swift
//  Tipster
//
//  Created by Yanet Leon on 1/11/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var billAmount: UILabel!
    @IBOutlet weak var lowTipPercent: UILabel!
    @IBOutlet weak var midTipPercent: UILabel!
    @IBOutlet weak var highTipPercent: UILabel!
    
    var billAmountNum:Double = 0;

    
    @IBAction func keypadNums(_ sender: UIButton) {
        if sender.tag-1 == 10 {
            billAmount.text = billAmount.text! + "."
        } else {
            billAmount.text = billAmount.text! + String(sender.tag-1)
            // Force unwrapping for the text in the UILabel and to convert the text to double.
            billAmountNum = Double(billAmount.text!)!
        }
        
    }
    
    @IBAction func clearScreenButton(_ sender: UIButton) {
        if billAmount.text != ""{
            if sender.tag == 0 {
                billAmount.text = ""
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


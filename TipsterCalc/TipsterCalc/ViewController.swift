//
//  ViewController.swift
//  TipsterCalc
//
//  Created by Yanet Leon on 1/13/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    // Property declarations to interact with UI components.
    @IBOutlet weak var billAmountLabel: UILabel!
    
    @IBOutlet weak var lowPercentLabel: UILabel!
    @IBOutlet weak var medPercentLabel: UILabel!
    @IBOutlet weak var highPercentLabel: UILabel!
  
    @IBOutlet weak var lowPercentAmtLabel: UILabel!
    @IBOutlet weak var medPercentAmtLabel: UILabel!
    @IBOutlet weak var highPercentAmtLabel: UILabel!
    
    @IBOutlet weak var lowTotalLabel: UILabel!
    @IBOutlet weak var medTotalLabel: UILabel!
    @IBOutlet weak var highTotalLabel: UILabel!
    
   
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    // Set to same as BuilderUI default to initialize values at run time.
    @IBOutlet weak var tipSliderVal: UISlider!
    @IBOutlet weak var groupSliderVal: UISlider!

    // var billAmount: Float = 100
    var billAmount: Float = 0
    var lowPercentNum: Float = 0
    var medPercentNum: Float = 0
    var highPercentNum: Float = 0
    
    var lowPercentAmnt: Float = 0
    var medPercentAmnt: Float = 0
    var highPercentAmnt: Float = 0
    
    var lowTotal: Float = 0
    var medTotal: Float = 0
    var highTotal: Float = 0
    
    
    func calculatTip() -> (lowpercent: Float, medpercent: Float, highpercent: Float, lowTotal: Float, medTotal: Float, highTotal: Float){
        
        lowPercentNum = billAmount * tipSliderVal.value/100 / groupSliderVal.value
        medPercentNum = billAmount * (tipSliderVal.value + 5)/100 / groupSliderVal.value
        highPercentNum = billAmount * (tipSliderVal.value + 10)/100 / groupSliderVal.value
        
        lowTotal = billAmount + billAmount * tipSliderVal.value/100 / groupSliderVal.value
        medTotal = billAmount + (billAmount * tipSliderVal.value + 5)/100 / groupSliderVal.value
        highTotal = billAmount + (billAmount * tipSliderVal.value + 10)/100 / groupSliderVal.value
        
        return (lowPercentNum, medPercentNum, highPercentNum, lowTotal, medTotal, highTotal)
        
    }
    
    
    func updateLabels() {
        // Updates all labels after each calculation.
        lowPercentLabel.text = String(Int(tipSliderVal.value)) + "%"
        medPercentLabel.text = String(Int(tipSliderVal.value) + 5) + "%"
        highPercentLabel.text = String(Int(tipSliderVal.value) + 10) + "%"
        
        (lowPercentAmnt, medPercentAmnt, highPercentAmnt, lowTotal, medTotal, highTotal) = calculatTip()
        lowPercentAmtLabel.text = String(lowPercentAmnt)
        medPercentAmtLabel.text = String(medPercentAmnt)
        highPercentAmtLabel.text = String(highPercentAmnt)
        
        lowTotalLabel.text = String(lowTotal)
        medTotalLabel.text = String(medTotal)
        highTotalLabel.text = String(highTotal)
        
        groupSizeLabel.text = String(Int(groupSliderVal.value))
        
    }
    
    
    func clearAll() {
        // Variables
        lowPercentNum = 0
        medPercentNum = 0
        highPercentNum = 0
        
        lowPercentAmnt = 0
        medPercentAmnt = 0
        highPercentAmnt = 0
        
        lowTotal = 0
        medTotal = 0
        highTotal = 0
        
        // All Labels
        updateLabels()
    
    }

    
    @IBAction func numbuttonPressed(_ sender: UIButton) {
        // If the . button is pressed.
        if sender.tag == 111 {
            billAmountLabel.text = billAmountLabel.text! + "."
        } else {
            billAmountLabel.text = billAmountLabel.text! + String(sender.tag)
        }
    }
    
    
    @IBAction func tipsliderChanged(_ sender: UISlider) {
        updateLabels()
    }
    
    
    @IBAction func groupsizeChanged(_ sender: UISlider) {
        updateLabels()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateLabels()

    }

    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        if billAmountLabel.text != ""{
            if sender.tag == 100 {
                billAmountLabel.text = ""
            }
        }
        
        // Clear all labels and calculations
        clearAll()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

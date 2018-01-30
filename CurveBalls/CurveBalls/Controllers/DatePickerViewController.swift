//
//  DatePickerViewController.swift
//  CurveBalls
//
//  Created by Yanet Leon on 1/24/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePickerPicked: UIDatePicker!
    @IBOutlet weak var shortDate: UILabel!
    @IBOutlet weak var mediumDate: UILabel!
    @IBOutlet weak var longDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Transform the date format and update the related labels.
        updateDateLabels(datepicked: datePickerPicked.date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateDateLabels(datepicked: Date) {
        shortDate.text = "Short:  \(convertDate(with: "MM/dd/yy", mydate: datepicked))"
        mediumDate.text = "Medium:  \(convertDate(with: "MMM dd, yyyy", mydate: datepicked))"
        longDate.text = "Long:  \(convertDate(with: "MMMM dd, yyyy", mydate: datepicked))"
        
        print("Short date: \(String(describing: shortDate.text))")
        print("Short date: \(String(describing: mediumDate.text))")
        print("Short date: \(String(describing: longDate.text))")

    
    }

    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDateLabels(datepicked: datePickerPicked.date)
    }
    
    func convertDate(with format: String, mydate: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = format
        
        
        return dateFormatter.string(from: mydate)
        
    }
    
}


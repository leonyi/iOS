//
//  ViewController.swift
//  auto_layout_sandbox
//
//  Created by Yanet Leon on 1/17/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Position from the top left corner.  With the following formula the position will be the same on all devices.
        // x = self.view.frame.width / 2
        // y = self.view.frame.height / 2
//        width = 100
//        height = 100
        
        // What if we want the object to be centered on the screen?
        // x = self.view.frame.width / 2  - square.width / 2
        // y = self.view.frame.height / 2 - square.height / 2
        
        let square = UIView(frame: CGRect(x: self.view.frame.width / 2 - 100 , y:  self.view.frame.height / 2 - 100, width: 200, height: 200 ))
        square.backgroundColor = UIColor.red
        self.view.addSubview(square)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


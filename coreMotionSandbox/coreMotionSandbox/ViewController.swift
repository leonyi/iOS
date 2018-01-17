//
//  ViewController.swift
//  coreMotionSandbox
//
//  Created by Yanet Leon on 1/14/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
   
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isDeviceMotionAvailable {
            print("We can detect device motion!")
            startReadingMotionData()
        }
        else {
            print("We cannot detect device motion!")
        }
    }
    
    func startReadingMotionData() {
        // set read speed
        motionManager.deviceMotionUpdateInterval = 1
        // start reading
        motionManager.startDeviceMotionUpdates(to: opQueue) {
            (data: CMDeviceMotion?, error: Error?) in
            
            if let mydata = data {
                print("mydata", mydata.attitude)
                print("pitch", self.degrees(mydata.attitude.pitch))
            }
        }
    }
    
    func degrees(_ radians: Double) -> Double {
        return 180/Double.pi * radians
    }

}


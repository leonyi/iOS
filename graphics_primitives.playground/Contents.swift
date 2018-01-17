//: Playground - noun: a place where people can play

import UIKit
import Foundation

struct pointStruct {
    var x = 0.0
    var y =  0.0
}

struct lineStruct {
    var start: pointStruct
    var end: pointStruct
    
    
    func calcLenght() -> Double {
        var distance: Double
        distance = sqrt(pow((end.x - start.x), 2) + pow((end.y - start.y), 2))
        return distance
        
    }
}

struct triangleStruct {
    var points = [pointStruct] ()
    
    func calcArea() -> Double {
        var area = 0.0
        
        return area
    }
    
}


//: Playground - noun: a place where people can play

import UIKit
import Foundation

func tossCoin() -> String {
    print("Tossing a Coin!")
    
    var heads = 0
    var tails = 0
    var result = ""
    
    let toss = arc4random_uniform(2)
    
    print("Toss is ", toss)
    
    if toss == 0{
        heads += 1
        result = "heads"
    } else {
        tails += 1
        result = "tails"
    }
    return result
}

func tossMultipleCoins(n: Int) -> Double {
    var headcount = 0
    var tailscount = 0
    var head_toss = 0.0
    
    if n == 0 {
        print("ERROR: enter a number >= 1")
        return 2
    }
    for _ in 1...n {
        let heads_or_tails = tossCoin()
        if heads_or_tails == "heads"{
            headcount += 1
        } else {
            tailscount += 1
        }
    }
    
    head_toss = Double(headcount) / Double(n)
    
    return head_toss
}

var result = tossMultipleCoins(n: 5)
print("Ratio of head toss to total toss: ", result)


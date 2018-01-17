//: Playground - noun: a place where people can play

import UIKit
import Foundation

func shuffle_one_time(mylist: [Int], randtimes: Int) {
    var mylist = mylist
    for x in 1...randtimes {
        let n1 = Int(arc4random_uniform(256))
        let n2 = Int(arc4random_uniform(256))

        print("Swapping:")
        print(mylist[n1],mylist[n2],separator: " <=> ")
        mylist.swapAt(n1,n2)
        
        print(mylist)
    }
}

func deletevalue(myval: Int, mylist: [Int]){
    var mylist = mylist

    print("Deleting:", myval)
    
    var index_number = mylist.index(of: myval)
    if let index = mylist.index(of: myval) { mylist.remove(at: index)}
    print("We found the answer to the Ultimate Question of Life, the Univers and Everything at index", index_number)
    print(mylist)
    
}

var list: [Int] = [Int]()

for i in 1...255 {
    list.append(i)
}

print("List is:")
print(list)

shuffle_one_time(mylist: list, randtimes: 5)
deletevalue(myval: 42, mylist: list)



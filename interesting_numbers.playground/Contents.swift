//: Playground - noun: a place where people can play

import UIKit

let interestingNumbers = [
    "Prime": [2,3, 5, 7, 11, 13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest{
            largest = number
        }
    }
}

print(largest)

// Another example

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

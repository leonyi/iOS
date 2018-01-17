//: Playground - noun: a place where people can play

import UIKit

// Loop that prints all of the values from 1 - 255
print("All values between 1 - 255:")
for i in 1...255{
    print(i)
}

print("All numbers divisible by 3 or 5:")
for i in 1...100{
    if i % 3 == 0  || i % 5 == 0{
        print(i)
    }
}

print("Print Fizz if number divisible by 3 or Buzz if divisible by 5:")
for i in 1...100{
    if i % 3 == 0 {
        print("Fizz")
    }
    if i % 5 == 0 {
        print("Buzz")
    }
}


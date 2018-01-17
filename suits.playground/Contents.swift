//: Playground - noun: a place where people can play

import UIKit

let suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
let cards = [1, 2, 3, 4, 5, 6 ,7, 8, 9, 10, 11, 12, 13]
var values_list = [Int]()
var deckOfCards = [String: Any ] ()

for k in suits{
    for v in cards {
        values_list.append(v)
    }
    deckOfCards[k]=values_list

}

// Output: ["Clubs": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "Diamonds": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13] ... ]
print(deckOfCards)


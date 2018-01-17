//: Playground - noun: a place where people can play

import UIKit
import Foundation

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

struct Card{
    // Holds the color values associated with the card
    var color: String
    var roll: UInt32
}

class Deck{
    var cards = [Card] ()
    var c: String = ""
    var discard = [Card] ()
    
    // Make sure that the deck has 10 cards of each color - total 30.
    init(){
        var toss: UInt32

        // Blue cards should have a roll value of either 1 or 2
        for _ in 1...10 {
            toss = arc4random_uniform(2) + 1
            cards.append( Card(color: "blue", roll: toss ) )
        }
        // Red cards should have a roll value of either 3 or 4
        for _ in 1...10 {
            toss = arc4random_uniform(2) + 3
            cards.append( Card(color: "red", roll: toss ) )
        }
        
        // Green cards should have a roll value between 4 and 6
        for _ in 1...10 {
            toss = arc4random_uniform(3) + 4
            cards.append( Card(color: "green", roll: toss ) )
        }
        
    }
    
    // Show the current deck
    func show() {
        for c in self.cards {
            print(c)
        }

    }
    
    // Selects the "top-most" card, removes it, and returns it.
    func deal(){
        self.cards.sort {
            $0.roll < $1.roll
        }
        
        for c in cards {
            print(c)
        }
    }
    
    // Checks if the deck has ran out of cards.
    func isEmpty(){
        if self.cards.isEmpty{
            print("Your deck is empty!")
        } else {
            let deck_size = self.cards.count
            print("\nYour deck has \(deck_size) cards!")
            
        }
        
    }
    
    // Randomly re-orders the deck's cards
    func shuffle_deck() {
        self.cards.shuffle()
    }
    
}

class Player{
    var hand = [Card] ()
    var name: String

    
    init (name: String){
        self.name = name
    }
    
    // Draws a card from a deck, adds it to the players hand, and returns it.
    func draw(deck: Deck) -> Card {
        var card: Card
        card = deck.cards.removeLast()
        self.hand.append(card)
        
        return card
    }
    
    // Returns a random number between 1 and 6.
    func rollDice() -> UInt32 {
        var randnum: UInt32
        randnum = arc4random_uniform(6) + 1
        
        return randnum
    }
    
    // Counts all player's cards, which match the given color string and roll integer
//    func matchingCards(color: String, roll: Int) -> Int {
//
//    }
    
}

let myDeck = Deck()
print("Original Deck:")
myDeck.show()
print("\nDeck Shuffled:")
myDeck.shuffle_deck()
myDeck.show()
myDeck.isEmpty()
print("\nDeck sorted:")
myDeck.deal()


let player1 = Player(name: "yleon")
let diceval = player1.rollDice()
print("\nDice: \(diceval)")

let card1 = player1.draw(deck: myDeck)
print("Drawn card: \(card1)")




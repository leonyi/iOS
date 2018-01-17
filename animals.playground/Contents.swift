//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Animal {
    var name: String
    var health: Int = 100
    
    init(name: String, health: Int){
        self.name = name
        self.health = health
    }
    
    func displayHealth(){
        print("Health: \(self.health)")
    }
    
}

class Cat: Animal {
    override init(name: String, health: Int){
        super.init(name: name, health: health)
    }
    
    func growl(){
        print("Rawr!")
    }
    
    func running(){
        print("Running!")
        self.health -= 10
    }
    
}

class Lion: Cat {
    override init(name: String, health: Int){
        super.init(name: name, health: health)
    }
    
    override func growl() {
        print("ROAR!!!! I am the King of the Jungle")
    }

}

class Cheetah: Cat {
    override init(name: String, health: Int){
        super.init(name: name, health: health)
    }
    
    override func running() {
        print("Running Fast!")
        if self.health > 50 {
            self.health -= 50
        } else {
            print("\(self.name) is exhausted! \(self.name) needs to sleep!")
        }
    }
    
    func sleep(){
        if self.health < 200 {
            self.health += 50
        } else {
            print("\(self.name)'s health is fully restored.")
            self.displayHealth()
        }
    }
}


let animal1 = Animal(name: "snaps", health: 500)
print("Animal: \(animal1.name)")
animal1.displayHealth()

let cat1 = Cat(name: "minino", health: 150)
print("\nCat: \(cat1.name)")
cat1.displayHealth()
cat1.growl()
cat1.running()
cat1.displayHealth()

let lion1 = Lion(name: "zimba", health: 200)
print("\nLion: \(lion1.name)")
lion1.displayHealth()
for _ in 1...3 {
        lion1.running()
}
lion1.displayHealth()
lion1.growl()

let cheetah1 = Cheetah(name: "rafiki", health: 150)
print("\nCheetah: \(cheetah1.name)")
cheetah1.displayHealth()
for lap in 1...4 {
    print("Lap: \(lap)")
    cheetah1.running()
}
cheetah1.displayHealth()
print("Sleeping!")
cheetah1.sleep()
cheetah1.displayHealth()
for nap in 1...4 {
    print("Sleeping!")
    cheetah1.sleep()
}



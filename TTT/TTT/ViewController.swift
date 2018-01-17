//
//  ViewController.swift
//  TTT
//
//  Created by Yanet Leon on 1/10/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var winnerLabel: UILabel!
    var isgameActive = true
    var activePlayer = 1 // red is the default starting color.
    var gameBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningPositions = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]

    
    @IBAction func tttButtonPressed(_ sender: UIButton) {
        
        if (gameBoard[sender.tag - 1 ] == 0 ){
            // Red is playing
            gameBoard[sender.tag - 1 ] = activePlayer
            
            if (activePlayer == 1){
                // Set background color to red
                sender.backgroundColor = .red
                
                // Now, is blue's turn to play.
                activePlayer = 2
            } else {
                // Set background color to blue
                sender.backgroundColor = .blue
                
                // And it's now red's turn.
                activePlayer = 1
            }
        }
        
        for position in winningPositions {
            if gameBoard[position[0]] != 0 && gameBoard[position[0]] == gameBoard[position[1]] && gameBoard[position[1]] == gameBoard[position[2]] {
                isgameActive = false

                if gameBoard[position[0]] == 1 {
                    print("Position combination: \(position) <=> Position[0]: \(position[0])")
                    print(gameBoard[position[0]])
                    print("Red won!")
                    winnerLabel.text = "Congrats Red Won!"
                } else {
                    winnerLabel.text = "Congrats Blue Won!"
                    print("Blue won!")
                }
                winnerLabel.isHidden = false
            }
        }
        
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        print("Reset button pressed!")
        gameBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isgameActive = true
        activePlayer = 1
        winnerLabel.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.backgroundColor = .gray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}


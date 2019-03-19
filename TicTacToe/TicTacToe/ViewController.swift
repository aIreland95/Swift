//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aaron on 3/5/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // variable declarations
    // label used for showing the winner
    @IBOutlet var winnerLabel: UILabel!
    
    // gameplay variables; active player, board and win conditions, and game progress bool
    private var player = 1
    private var gameInProgress = true
    private var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    //large array of all winning combinations based on button tags
    private let winConditions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6], [9, 10, 11], [12, 13, 14], [15, 16, 17], [9, 12, 15], [10, 13, 16], [11, 14, 17], [9, 13, 17], [11, 13, 15], [18, 19, 20], [21, 22, 23], [24, 25, 26], [18, 21, 24], [19, 22, 25], [20, 23, 26], [18, 22, 26], [20, 22, 24], [0, 9, 18], [1, 10, 19], [2, 11, 20], [3, 12, 21], [4, 13, 22], [5, 14, 23], [6, 15, 24], [7, 16, 25], [8, 17, 26], [0, 12, 24], [1, 13, 25], [2, 14, 26], [3, 13, 23], [5, 13, 21], [6, 12, 18], [7, 13, 19], [8, 14, 20], [0, 10, 20], [2, 10, 18], [6, 16, 26], [8, 16, 24], [0, 13, 26], [2, 13, 24], [6, 13, 20], [8, 13, 18]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // action if one of nine buttons are pushed by the user
    @IBAction func pieceSelected(_ sender: AnyObject) {
        
        // if statement, checks if the board is empty and if gameInProgress is true, commences gameplay if so
        if (gameState[sender.tag - 1] == 0 && gameInProgress == true) {
            
            gameState[sender.tag - 1] = player
            
            // transition block, provides a flip animation when a game piece area is selected
            UIView.transition(with: sender as? UIView ?? winnerLabel, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                
                // checks if player 1 is active
                if (self.player == 1) {
                    
                    // sets the gamePiece image to an X, switches to player 2's turn
                    sender.setImage(UIImage(named: "cross"), for: UIControl.State())
                    self.player = 2
                    self.winnerLabel.text = "Player 2's Turn!"
                }
                // checks if player 2 is active (or player 1 is inactive)
                else {
                    
                    // sets the gamePiece image to an O, switches to player 1's turn
                    sender.setImage(UIImage(named: "circle"), for: UIControl.State())
                    self.player = 1
                    self.winnerLabel.text = "Player 1's Turn!"
                }
                
            }, completion: nil)
            
        }
        
        // for loop that checks for a win condition
        for condition in winConditions {
            
            // if statement, checks if the gameState matches one of the defined win conditions, turns gameInProgress to false
            if (gameState[condition[0]] != 0 && gameState[condition[0]] == gameState[condition[1]] && gameState[condition[1]] == gameState[condition[2]]) {
                
                gameInProgress = false
                
                // checks if player 1 (cross player) wins
                if (gameState[condition[0]] == 1) {
                    
                    self.winnerLabel.text = "Player 1 Wins!"
                }
                else {
                    
                    self.winnerLabel.text = "Player 2 Wins!"
                }
            }
        }
    }
    
    
    // action used for resetting the game
    @IBAction func resetGame(_ sender: AnyObject) {
        
        // gameState is all set to 0, player 1 starts, and the game is back in progress
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        player = 1
        gameInProgress = true
        winnerLabel.text = "Player 1's Turn!"
        
        // for loop, loops through tags and resets the images of all buttons
        for tag in 1...27 {
            
            let gamePiece = view.viewWithTag(tag) as? UIButton
            
            UIView.transition(with: gamePiece ?? winnerLabel, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                
                gamePiece?.setImage(nil, for: UIControl.State())
                
            }, completion: nil)
        }
    }
}

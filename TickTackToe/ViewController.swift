//
//  ViewController.swift
//  TickTackToe
//
//  Created by Najd Alsughaiyer on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game(gameColors: [UIColor.blue, UIColor.red])
    
    @IBOutlet weak var gameButtons: UIStackView!
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        winnerLabel.isHidden = true
        game.gameColors.swapAt(0, 1)
        game = Game(gameColors: game.gameColors)
        
        for stack in gameButtons.subviews {
            for button in stack.subviews {
                button.backgroundColor = UIColor.opaqueSeparator
            }
        }
        
    }
    
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        if game.takeTurn(sender: sender) {
            winnerLabel.isHidden = false
            let players = [game.gameColors[0] == UIColor.blue ? "Blue": "Red", game.gameColors[1] == UIColor.blue ? "Blue": "Red"]
            switch game.winner {
                case "e": winnerLabel.text = "\(players[0]) won!"
                case "o": winnerLabel.text = "\(players[1]) won!"
                default: winnerLabel.text = "Tie between Red and Blue"
            }
        }
    }
}


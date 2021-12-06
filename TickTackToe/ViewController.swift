//
//  ViewController.swift
//  TickTackToe
//
//  Created by Najd Alsughaiyer on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game(evenColor: UIColor.blue, oddColor: UIColor.red)
    
    @IBOutlet weak var gameButtons: UIStackView!
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        let evenColor = game.oddColor
        let oddColor = game.evenColor
        game = Game(evenColor: evenColor, oddColor: oddColor)
        
        for stack in gameButtons.subviews {
            for button in stack.subviews {
                button.backgroundColor = UIColor.opaqueSeparator
            }
        }
        
    }
    
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        game.takeTurn(sender: sender)
    }
}


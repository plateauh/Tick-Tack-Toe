//
//  Game.swift
//  TickTackToe
//
//  Created by Najd Alsughaiyer on 06/12/2021.
//

import UIKit

public class Game {
    
    public var evenColor: UIColor
    public var oddColor: UIColor
    var board = ["n", "n", "n", "n", "n", "n", "n", "n", "n"]
    var turnIndx = 0
    var gameEnded = false
    
    init(evenColor: UIColor, oddColor: UIColor) {
        self.evenColor = evenColor
        self.oddColor = oddColor
    }
    
    public func takeTurn(sender: UIButton) {
        let isAvailable = board[sender.tag] == "n"
        if !isEnded() && isAvailable {
            if turnIndx%2 == 0 {
                sender.backgroundColor = evenColor
                board[sender.tag] = "e"
            }
            else {
                sender.backgroundColor = oddColor
                board[sender.tag] = "o"
            }
            turnIndx += 1
        }
    }
    
    public func isEnded() -> Bool {
        return gameEnded || turnIndx == 10
    }
}

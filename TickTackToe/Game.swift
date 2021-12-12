//
//  Game.swift
//  TickTackToe
//
//  Created by Najd Alsughaiyer on 06/12/2021.
//  I think I turned my code not into a spaghetti, but a fettuccine
//  I could make the design of class better but my empty head doesn't want to do it

import UIKit

public class Game {
    
    public var gameColors: [UIColor]
    var board = ["n", "n", "n", "n", "n", "n", "n", "n", "n"]
    var turnIndx = 0
    var gameEnded = false
    var winner: Character = "n"
    
    init(gameColors: [UIColor]) {
        self.gameColors = gameColors
    }
    
    public func takeTurn(sender: UIButton) -> Bool {
        let isAvailable = board[sender.tag] == "n"
        if isAvailable && !gameEnded {
            if turnIndx%2 == 0 {
                sender.backgroundColor = gameColors[0]
                board[sender.tag] = "e"
                if turnIndx >= 4 { checkWinner(player: "e") }
            }
            else {
                sender.backgroundColor = gameColors[1]
                board[sender.tag] = "o"
                if turnIndx >= 5 { checkWinner(player: "o") }
            }
            turnIndx += 1
            if turnIndx > 8 { gameEnded = true }
        }
        return gameEnded
    }
    
    func checkWinner(player: Character) {
        for i in 0...7 {
            var line = ""
            switch i {
                case 0: line = board[0] + board[1] + board[2]
                case 1: line = board[3] + board[4] + board[5]
                case 2: line = board[6] + board[7] + board[8]
                case 3: line = board[0] + board[3] + board[6]
                case 4: line = board[1] + board[4] + board[7]
                case 5: line = board[2] + board[5] + board[8]
                case 6: line = board[0] + board[4] + board[8]
                case 7: line = board[2] + board[4] + board[6]
                default: print("Default")
            }
            if line == "\(player)\(player)\(player)" {
                winner = player
                gameEnded = true
                break
            }
        }
    }
    
}

//
//  Game.swift
//  TicTacToe
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import Foundation

// MARK: - Enum

enum Player: String {
    case cross
    case circle
    case none
}

class Game {
    
    // MARK: - Properties
    
    var currentPlayer: Player = .cross
    
    var boxes : [Player] =  {
        var array = [Player]()
        for _ in 0...8 {
            array.append(.none)
        }
        return array
    }()
    
    // MARK: - Methods
    
    func playAt(index: Int) {
        boxes[index] = currentPlayer
        
        if !gameHasAWinner() {
            if currentPlayer == .cross {
                currentPlayer = .circle
            } else {
                currentPlayer = .cross
            }
        }
    }
    
    func canPlayAt(index: Int) -> Bool {
        return boxes[index] == .none && !gameHasAWinner()
    }
    
    func gameHasAWinner() -> Bool {
        var hasAWinner = false
        
        var winningLines = [[Int]]()
        winningLines.append([0,1,2]) // topWinningRow
        winningLines.append([3,4,5]) // middleWinningRow
        winningLines.append([6,7,8]) // bottomWinningRow
        winningLines.append([0,3,6]) // leftWinningCol
        winningLines.append([1,4,7]) // middleWinningCol
        winningLines.append([2,5,8]) // rightWinningCol
        winningLines.append([0,4,8]) // firstDiagonal
        winningLines.append([2,4,6]) // secondDiagonal
        
        for winLine in winningLines {
            
            if boxes[winLine[0]] != .none &&
                boxes[winLine[0]] == boxes[winLine[1]] &&
                boxes[winLine[0]] == boxes[winLine[2]] {
                hasAWinner = true
                break
            }
        }
        
        return hasAWinner
    }
    
    func isADraw() -> Bool {
        return !boxes.contains(.none) && !gameHasAWinner()
    }
    
    func resetGame() {
        currentPlayer = .cross
        
        var array = [Player]()
        for _ in 0...8 {
            array.append(.none)
        }
        boxes = array
    }
}

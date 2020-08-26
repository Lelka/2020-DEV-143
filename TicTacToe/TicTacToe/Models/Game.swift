//
//  Game.swift
//  TicTacToe
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import Foundation

// MARK: - Enum

enum Turn: String {
    case cross
    case circle
    case none
}

class Game {
    
    // MARK: - Properties
    
    var currentTurn: Turn = .cross
    
    var boxes : [Turn] =  {
        var array = [Turn]()
        for _ in 0...8 {
            array.append(.none)
        }
        return array
    }()
    
    let winningLines: [[Int]] = {
        var array = [[Int]]()
        array.append([0,1,2]) // topWinningRow
        array.append([3,4,5]) // middleWinningRow
        array.append([6,7,8]) // bottomWinningRow
        array.append([0,3,6]) // leftWinningCol
        array.append([1,4,7]) // middleWinningCol
        array.append([2,5,8]) // rightWinningCol
        array.append([0,4,8]) // firstDiagonal
        array.append([2,4,6]) // secondDiagonal
        return array
    }()
    
    // MARK: - Methods
    
    func playAt(index: Int) {
        boxes[index] = currentTurn
    }
    
    func switchTurn() {
        if currentTurn == .cross {
            currentTurn = .circle
        } else {
            currentTurn = .cross
        }
    }
    
    func canPlayAt(index: Int) -> Bool {
        return boxes[index] == .none && !gameHasAWinner()
    }
    
    func gameHasAWinner() -> Bool {
        var hasAWinner = false
        
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
}

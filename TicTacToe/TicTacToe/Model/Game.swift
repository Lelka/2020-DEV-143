//
//  Game.swift
//  TicTacToe
//
//  Created by Kalenga Kalele on 25/08/2020.
//  Copyright © 2020 tictactoe. All rights reserved.
//

import Foundation

enum Player {
    case cross
    case circle
    case none
}

class Game {
    
    var currentPlayer: Player
    
    var boxes = [Player]()
    
    init() {
        currentPlayer = .cross
        
        var array = [Player]()
        for _ in 0...8 {
            array.append(.none)
        }
        boxes = array
    }
    
    func play() {
        currentPlayer = .circle
    }
    
    func canPlayAt(index: Int) -> Bool {
        return boxes[index] == .none
    }
}

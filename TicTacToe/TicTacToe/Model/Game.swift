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
}

class Game {
    
    var currentPlayer: Player
    
    init() {
        currentPlayer = .cross
    }
    
    func play() {
        currentPlayer = .circle
    }
    
    func canPlayAt(index: Int) -> Bool {
        return false
    }
}
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
    
    let currentPlayer: Player
    
    init() {
        currentPlayer = .cross
    }
}

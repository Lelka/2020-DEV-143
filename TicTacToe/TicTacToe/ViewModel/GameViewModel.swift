//
//  GameViewModel.swift
//  TicTacToe
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import Foundation

public func localized(_ id: String) -> String {
    return NSLocalizedString(id, comment: "")
}

class GameViewModel {
    var game = Game()
    
    var informationText: String {
        return localized("A VOUS DE JOUER")
    }
    
    var playAgainButtonText: String {
        return localized("REJOUER")
    }
    
    var winText: String {
        return localized("GAGNE !!!")
    }
    
    func playAt(index: Int) {
        if game.canPlayAt(index: index) {
            game.playAt(index: index)
        } else if game.gameHasAWinner() {
            
        }
    }
}

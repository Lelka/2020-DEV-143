//
//  GameViewModel.swift
//  TicTacToe
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import Foundation

protocol GameViewModelDelegate: class {
    func gamePlay()
    func gameHasAWinner()
    func gameIsADraw()
}

class GameViewModel {
    
    weak var delegate: GameViewModelDelegate?
    
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
    
    var currentPlayerImageName: String {
        return game.currentPlayer.rawValue
    }
    
    func playAt(index: Int) {
        if game.canPlayAt(index: index) {
            delegate?.gamePlay()
            game.playAt(index: index)
            
            if game.gameHasAWinner() {
                delegate?.gameHasAWinner()
            } else if game.isADraw() {
                delegate?.gameIsADraw()
            }
        }
    }
    
    func resetGame() {
        game.resetGame()
    }
}

public func localized(_ id: String) -> String {
    return NSLocalizedString(id, comment: "")
}

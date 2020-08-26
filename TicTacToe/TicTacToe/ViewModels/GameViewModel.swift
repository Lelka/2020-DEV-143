//
//  GameViewModel.swift
//  TicTacToe
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import Foundation

// MARK: - Protocols

protocol GameViewModelDelegate: class {
    func updateTappedButton()
    func updateNextPlayerImage()
    func gameHasAWinner()
    func gameIsADraw()
}

class GameViewModel {
    
    // MARK: - Properties
    
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
    
    var drawText: String {
        return localized("MATCH NUL !!!")
    }
    
    var currentPlayerImageName: String {
        return game.currentTurn.rawValue
    }
    
    // MARK: - Methods
    
    func playAt(index: Int) {
        if game.canPlayAt(index: index) {
            delegate?.updateTappedButton()
            game.playAt(index: index)
            
            if !game.gameHasAWinner() {
                game.switchTurn()
                delegate?.updateNextPlayerImage()
            } else if game.gameHasAWinner() {
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

// MARK: - Localization

public func localized(_ id: String) -> String {
    return NSLocalizedString(id, comment: "")
}

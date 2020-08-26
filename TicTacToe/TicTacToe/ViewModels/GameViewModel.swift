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
    func updateNextTurnImage()
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
    
    var currentTurn: Turn {
        return game.currentTurn
    }
    
    var currentTurnImageName: String {
        return game.currentTurn.rawValue
    }
    
    var boxes: [Turn] {
        get {
            return game.boxes
        }
        set(newValue) {
            game.boxes = newValue
        }
    }
    
    // MARK: - Methods
    
    func playAt(index: Int) {
        if canPlayAt(index: index) {
            delegate?.updateTappedButton()
            game.playAt(index: index)
            
            if isADraw() {
                delegate?.gameIsADraw()
            } else if gameHasAWinner() {
                delegate?.gameHasAWinner()
            } else {
                game.switchTurn()
                delegate?.updateNextTurnImage()
            }
        }
    }
    
    func canPlayAt(index: Int) -> Bool {
        return game.canPlayAt(index: index)
    }
    
    func gameHasAWinner() -> Bool {
        return game.gameHasAWinner()
    }
    
    func isADraw() -> Bool {
        return game.isADraw()
    }
    
    func setBoxesAt(index: Int, value: Turn) {
        game.boxes[index] = value
    }
    
    func resetGame() {
        game = Game()
    }
}

// MARK: - Localization

public func localized(_ id: String) -> String {
    return NSLocalizedString(id, comment: "")
}

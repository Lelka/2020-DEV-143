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
    func updateNextStatusImage()
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
    
    var currentStatus: Status {
        return game.currentStatus
    }
    
    var currentStatusImageName: String {
        return game.currentStatus.rawValue
    }
    
    var boxes: [Status] {
        get {
            return game.boxes
        }
        set(newValue) {
            game.boxes = newValue
        }
    }
    
    // MARK: - Methods
    
    func playAt(index: Int) {
        guard index >= 0, index < 9 else { return }
        
        if canPlayAt(index: index) {
            delegate?.updateTappedButton()
            game.playAt(index: index)
            
            if isADraw() {
                delegate?.gameIsADraw()
            } else if gameHasAWinner() {
                delegate?.gameHasAWinner()
            } else {
                game.switchStatus()
                delegate?.updateNextStatusImage()
            }
        }
    }
    
    func canPlayAt(index: Int) -> Bool {
        guard index >= 0, index < 9 else { return false }
        
        return game.canPlayAt(index: index)
    }
    
    func gameHasAWinner() -> Bool {
        return game.gameHasAWinner()
    }
    
    func isADraw() -> Bool {
        return game.isADraw()
    }
    
    func setBoxesAt(index: Int, value: Status) {
        guard index >= 0, index < 9 else { return }
        
        game.boxes[index] = value
    }
    
    func resetGame() {
        game = Game()
    }
    
    func getWinningLines() -> [[Int]]  {
        return game.winningLines
    }
}

// MARK: - Localization

public func localized(_ id: String) -> String {
    return NSLocalizedString(id, comment: "")
}

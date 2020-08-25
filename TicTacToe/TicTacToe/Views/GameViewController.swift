//
//  GameViewController.swift
//  TicTacToe
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var viewModelGame = GameViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelGame.delegate = self
    }
}

extension GameViewController: GameViewModelDelegate {
    func gameHasAWinner() {
        
    }
    
    func gameIsADraw() {
        
    }
}


//
//  GameViewController.swift
//  TicTacToe
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var btPlayAgain: UIButton!
    
    @IBOutlet weak var ivCurrentPlayer: UIImageView!
    
    @IBOutlet weak var lbInfos: UILabel!
    
    @IBOutlet weak var viewBoard: UIView!
    
    // MARK: - Properties
    
    var viewModelGame = GameViewModel()
    
    var selectedButton = UIButton()
    
    // MARK: - Methods Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelGame.delegate = self
        
        initGameBoardUI()
    }
    
    func initGameBoardUI() {
        button1.setBackgroundImage(nil, for: .normal)
        button2.setBackgroundImage(nil, for: .normal)
        button3.setBackgroundImage(nil, for: .normal)
        button4.setBackgroundImage(nil, for: .normal)
        button5.setBackgroundImage(nil, for: .normal)
        button6.setBackgroundImage(nil, for: .normal)
        button7.setBackgroundImage(nil, for: .normal)
        button8.setBackgroundImage(nil, for: .normal)
        button9.setBackgroundImage(nil, for: .normal)
        
        ivCurrentPlayer.isHidden = false
        ivCurrentPlayer.image = UIImage(named: viewModelGame.currentPlayerImageName)
        
        btPlayAgain.layer.cornerRadius = 5
        btPlayAgain.layer.borderWidth = 2
        btPlayAgain.setTitleColor(.black, for: .normal)
        
        viewBoard.layer.borderWidth = 3
        viewBoard.layer.borderColor = UIColor.black.cgColor
        
        localize()
    }
    
    func localize() {
        lbInfos.text = viewModelGame.informationText
        btPlayAgain.setTitle(viewModelGame.playAgainButtonText, for: .normal)
    }
}

// MARK: - IBActions

extension GameViewController {
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        selectedButton = sender
        viewModelGame.playAt(index: sender.tag)
    }
    
    @IBAction func replayAction(_ sender: UIButton) {
        viewModelGame.resetGame()
        initGameBoardUI()
    }
}

// MARK: - GameViewModelDelegate

extension GameViewController: GameViewModelDelegate {
    
    func gamePlay() {
        selectedButton.setBackgroundImage(UIImage(named: viewModelGame.currentPlayerImageName), for: .normal)
    }
    
    func gameHasAWinner() {
        lbInfos.text = viewModelGame.winText
        ivCurrentPlayer.image = UIImage(named: viewModelGame.currentPlayerImageName)
    }
    
    func gameIsADraw() {
        ivCurrentPlayer.isHidden = true
        lbInfos.text = viewModelGame.drawText
    }
}

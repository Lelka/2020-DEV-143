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
    
    @IBOutlet weak var ivCurrentStatus: UIImageView!
    
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
        button1.tag = 0
        button2.setBackgroundImage(nil, for: .normal)
        button2.tag = 1
        button3.setBackgroundImage(nil, for: .normal)
        button3.tag = 2
        button4.setBackgroundImage(nil, for: .normal)
        button4.tag = 3
        button5.setBackgroundImage(nil, for: .normal)
        button5.tag = 4
        button6.setBackgroundImage(nil, for: .normal)
        button6.tag = 5
        button7.setBackgroundImage(nil, for: .normal)
        button7.tag = 6
        button8.setBackgroundImage(nil, for: .normal)
        button8.tag = 7
        button9.setBackgroundImage(nil, for: .normal)
        button9.tag = 8
        
        ivCurrentStatus.isHidden = false
        ivCurrentStatus.image = UIImage(named: viewModelGame.currentStatusImageName)
        
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
    
    func updateTappedButton() {
        selectedButton.setBackgroundImage(UIImage(named: viewModelGame.currentStatusImageName), for: .normal)
    }
    
    func updateNextStatusImage() {
        ivCurrentStatus.image = UIImage(named: viewModelGame.currentStatusImageName)
    }
    
    func gameHasAWinner() {
        lbInfos.text = viewModelGame.winText
        ivCurrentStatus.image = UIImage(named: viewModelGame.currentStatusImageName)
    }
    
    func gameIsADraw() {
        ivCurrentStatus.isHidden = true
        lbInfos.text = viewModelGame.drawText
    }
}

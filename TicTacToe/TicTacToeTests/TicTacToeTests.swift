//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

    func testFirstPlayerIsCross() {
        
        let game = Game()
        let firstPlayer: Player = .cross
        let currentPlayer = game.currentPlayer
        
        XCTAssertEqual(currentPlayer, firstPlayer)
    }
    
    func testExpectedNextPlayerAfterFirstMove() {
        let nextPlayer: Player = .circle
        
        let game = Game()
        game.play()
        
        let currentPlayer = game.currentPlayer
        
        XCTAssertEqual(currentPlayer, nextPlayer)
    }
    
    func testIfPlayerCanPlayAtPosition() {
        let expected = false
        
        let game = Game()
        let actual = game.canPlayAt(index: 3)
        
        XCTAssertEqual(expected, actual)
    }
}

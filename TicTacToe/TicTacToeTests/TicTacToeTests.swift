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
        game.playAt(index: 0)
        
        let currentPlayer = game.currentPlayer
        
        XCTAssertEqual(currentPlayer, nextPlayer)
    }
    
    func testPlayerCannotPlayOnPlayedPosition() {
        let expected = false
        
        let game = Game()
        game.boxes[3] = .cross
        let actual = game.canPlayAt(index: 3)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPlayersPlayOnTheBoard() {
        let expected: Player = .cross
        
        let game = Game()
        game.playAt(index: 0)
        
        let player = game.boxes[0]
        
        XCTAssertEqual(expected, player)
    }
}

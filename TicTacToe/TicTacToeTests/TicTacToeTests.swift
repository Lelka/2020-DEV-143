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
        let firstPlayer: Turn = .cross
        let currentPlayer = game.currentTurn
        
        XCTAssertEqual(currentPlayer, firstPlayer)
    }
    
    func testExpectedNextPlayerAfterFirstMove() {
        let nextPlayer: Turn = .circle
        
        let game = Game()
        game.playAt(index: 0)
        
        let currentPlayer = game.currentTurn
        
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
        let expectedCross: Turn = .cross
        let expectedCircle: Turn = .circle
        
        let game = Game()
        game.playAt(index: 0)
        game.playAt(index: 3)
        
        let crossPlayer = game.boxes[0]
        let circlePlayer = game.boxes[3]
        
        XCTAssertEqual(expectedCross, crossPlayer)
        XCTAssertEqual(expectedCircle, circlePlayer)
    }
    
    func testPlayerHasThreeInARowHorizontally() {
        let game = Game()
        game.playAt(index: 0) // cross
        game.playAt(index: 3) // circle
        game.playAt(index: 1) // cross
        game.playAt(index: 4) // circle
        game.playAt(index: 2) // cross
        
        XCTAssertTrue(game.boxes[0] == .cross)
        XCTAssertTrue(game.boxes[1] == .cross)
        XCTAssertTrue(game.boxes[1] == .cross)
    }
    
    func testPlayerHasThreeInARowVertically() {
        let game = Game()
        game.playAt(index: 0) // cross
        game.playAt(index: 1) // circle
        game.playAt(index: 3) // cross
        game.playAt(index: 2) // circle
        game.playAt(index: 6) // cross
        
        XCTAssertTrue(game.boxes[0] == .cross)
        XCTAssertTrue(game.boxes[3] == .cross)
        XCTAssertTrue(game.boxes[6] == .cross)
    }
    
    func testPlayerHasThreeInARowDiagonally() {
        let game = Game()
        game.playAt(index: 0) // cross
        game.playAt(index: 3) // circle
        game.playAt(index: 4) // cross
        game.playAt(index: 2) // circle
        game.playAt(index: 8) // cross
        
        XCTAssertTrue(game.boxes[0] == .cross)
        XCTAssertTrue(game.boxes[4] == .cross)
        XCTAssertTrue(game.boxes[8] == .cross)
    }
    
    func testFillTheBoard() {
        let expected = false
        
        let game = Game()
        game.playAt(index: 0) // cross
        game.playAt(index: 1) // circle
        game.playAt(index: 2) // cross
        game.playAt(index: 3) // circle
        game.playAt(index: 4) // cross
        game.playAt(index: 5) // circle
        game.playAt(index: 6) // cross
        game.playAt(index: 7) // circle
        game.playAt(index: 8) // cross
        
        let actual = game.boxes.contains(.none)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testCrossWinsTheGame() {
        let expected = true
        let winner: Turn = .cross
        
        let game = Game()
        game.playAt(index: 0) // cross
        game.playAt(index: 3) // circle
        game.playAt(index: 4) // cross
        game.playAt(index: 2) // circle
        game.playAt(index: 8) // cross
        
        let actual = game.gameHasAWinner()
        
        XCTAssertEqual(expected, actual)
        XCTAssertEqual(winner, game.currentTurn)
    }
    
    func testCircleWinsTheGame() {
        let expected = true
        let winner: Turn = .circle
        
        let game = Game()
        game.playAt(index: 0) // cross
        game.playAt(index: 1) // circle
        game.playAt(index: 2) // cross
        game.playAt(index: 4) // circle
        game.playAt(index: 8) // cross
        game.playAt(index: 7) // circle
        
        let actual = game.gameHasAWinner()
        
        XCTAssertEqual(expected, actual)
        XCTAssertEqual(winner, game.currentTurn)
    }
    
    func testGameIsADraw() {
        let expected = true
        
        let game = Game()
        game.boxes[0] = .circle
        game.boxes[1] = .circle
        game.boxes[2] = .cross
        game.boxes[3] = .cross
        game.boxes[4] = .cross
        game.boxes[5] = .circle
        game.boxes[6] = .circle
        game.boxes[7] = .cross
        game.boxes[8] = .cross
        
        let actual = game.isADraw()
        
        XCTAssertEqual(expected, actual)
    }
    
    func testResetGame() {
        let game = Game()
        game.playAt(index: 0) // cross
        game.playAt(index: 1) // circle
        game.playAt(index: 2) // cross
        game.playAt(index: 4) // circle
        game.resetGame()
        
        let value = !game.boxes.contains(.cross) && !game.boxes.contains(.circle)
        let expectedPlayer: Turn = .cross
        
        XCTAssertTrue(value)
        XCTAssertEqual(expectedPlayer, game.currentTurn)
    }
}

//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Copyright © 2020 tictactoe. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

    func testCheckIfFirstTurnIsCross() {
        
        let gameVM = GameViewModel()
        let firstTurn: Turn = .cross
        let currentTurn = gameVM.currentTurn
        
        XCTAssertEqual(currentTurn, firstTurn)
    }
    
    func testSecondTurnIsCircle() {
        let nextTurn: Turn = .circle
        
        let gameVM = GameViewModel()
        gameVM.playAt(index: 0)
        
        let currentTurn = gameVM.currentTurn
        
        XCTAssertEqual(currentTurn, nextTurn)
    }
    
    func testCannotPlayOnPlayedPosition() {
        let expected = false
        
        let gameVM = GameViewModel()
        gameVM.boxes[3] = .cross
        let actual = gameVM.canPlayAt(index: 3)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testPlayOnTheBoard() {
        let expectedCross: Turn = .cross
        let expectedCircle: Turn = .circle
        
        let gameVM = GameViewModel()
        gameVM.playAt(index: 0)
        gameVM.playAt(index: 3)
        
        let crossTurn = gameVM.boxes[0]
        let circleTurn = gameVM.boxes[3]
        
        XCTAssertEqual(expectedCross, crossTurn)
        XCTAssertEqual(expectedCircle, circleTurn)
    }
    
    func testPlayerHasThreeInARowHorizontally() {
        let gameVM = GameViewModel()
        gameVM.playAt(index: 0) // cross
        gameVM.playAt(index: 3) // circle
        gameVM.playAt(index: 1) // cross
        gameVM.playAt(index: 4) // circle
        gameVM.playAt(index: 2) // cross
        
        XCTAssertTrue(gameVM.boxes[0] == .cross)
        XCTAssertTrue(gameVM.boxes[1] == .cross)
        XCTAssertTrue(gameVM.boxes[1] == .cross)
    }
    
    func testPlayerHasThreeInARowVertically() {
        let gameVM = GameViewModel()
        gameVM.playAt(index: 0) // cross
        gameVM.playAt(index: 1) // circle
        gameVM.playAt(index: 3) // cross
        gameVM.playAt(index: 2) // circle
        gameVM.playAt(index: 6) // cross
        
        XCTAssertTrue(gameVM.boxes[0] == .cross)
        XCTAssertTrue(gameVM.boxes[3] == .cross)
        XCTAssertTrue(gameVM.boxes[6] == .cross)
    }
    
    func testPlayerHasThreeInARowDiagonally() {
        let gameVM = GameViewModel()
        gameVM.playAt(index: 0) // cross
        gameVM.playAt(index: 3) // circle
        gameVM.playAt(index: 4) // cross
        gameVM.playAt(index: 2) // circle
        gameVM.playAt(index: 8) // cross
        
        XCTAssertTrue(gameVM.boxes[0] == .cross)
        XCTAssertTrue(gameVM.boxes[4] == .cross)
        XCTAssertTrue(gameVM.boxes[8] == .cross)
    }
    
    func testCrossWinsTheGame() {
        let expected = true
        let winner: Turn = .cross
        
        let gameVM = GameViewModel()
        gameVM.playAt(index: 0) // cross
        gameVM.playAt(index: 3) // circle
        gameVM.playAt(index: 4) // cross
        gameVM.playAt(index: 2) // circle
        gameVM.playAt(index: 8) // cross
        
        let actual = gameVM.gameHasAWinner()
        
        XCTAssertEqual(expected, actual)
        XCTAssertEqual(winner, gameVM.currentTurn)
    }
    
    func testCircleWinsTheGame() {
        let expected = true
        let winner: Turn = .circle
        
        let gameVM = GameViewModel()
        gameVM.playAt(index: 0) // cross
        gameVM.playAt(index: 1) // circle
        gameVM.playAt(index: 2) // cross
        gameVM.playAt(index: 4) // circle
        gameVM.playAt(index: 8) // cross
        gameVM.playAt(index: 7) // circle
        
        let actual = gameVM.gameHasAWinner()
        
        XCTAssertEqual(expected, actual)
        XCTAssertEqual(winner, gameVM.currentTurn)
    }
    
    func testGameIsADraw() {
        let expected = true
        
        let gameVM = GameViewModel()
        gameVM.boxes[0] = .circle
        gameVM.boxes[1] = .circle
        gameVM.boxes[2] = .cross
        gameVM.boxes[3] = .cross
        gameVM.boxes[4] = .cross
        gameVM.boxes[5] = .circle
        gameVM.boxes[6] = .circle
        gameVM.boxes[7] = .cross
        gameVM.boxes[8] = .cross
        
        let actual = gameVM.isADraw()
        
        XCTAssertEqual(expected, actual)
    }
    
    func testResetGame() {
        let gameVM = GameViewModel()
        gameVM.playAt(index: 0) // cross
        gameVM.playAt(index: 1) // circle
        gameVM.playAt(index: 2) // cross
        gameVM.playAt(index: 4) // circle
        gameVM.resetGame()
        
        let value = !gameVM.boxes.contains(.cross) && !gameVM.boxes.contains(.circle)
        let expectedPlayer: Turn = .cross
        
        XCTAssertTrue(value)
        XCTAssertEqual(expectedPlayer, gameVM.currentTurn)
    }
}

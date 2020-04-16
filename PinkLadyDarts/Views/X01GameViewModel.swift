//
//  X01GameViewModel.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 4/15/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//


import Foundation
import Combine

// TODO:
// add support to track single, double, triples
//

// Player Specific Information
class Player: ObservableObject {
    private var name: String
    private var isTurn: Bool
    private var currentRoundScore: Int
    private var X01Points: Int
    private var previousRoundScore: Int
    private var dartCount: Int
    private var didWin: Bool
    
    init(name: String, isTurn: Bool, X01Points: Int) {
        self.name = name
        self.isTurn = isTurn
        self.currentRoundScore = 0
        self.X01Points = X01Points
        self.previousRoundScore = X01Points
        self.dartCount = 3
        self.didWin = false
    }
    
    
    func decreaseDartCount() {
        dartCount -= 1
    }
    
    func getIsTurn() -> Bool {
        return isTurn
    }
    
    func getCurrentRoundScore() -> Int {
        return currentRoundScore
    }
    
    func getPreviousRoundScore() -> Int {
        return previousRoundScore
    }
    
    func getName() -> String {
        return name
    }
    
    func getDartCount() -> Int {
        return dartCount
    }
    
    func getX01Points() -> Int {
        return X01Points
    }
    
    func setX01Points(value: Int) {
        X01Points = value
    }
    
    func setCurrentRoundScore(value: Int) {
        currentRoundScore = value
    }
    
    func setPreviousRoundScore(value: Int) {
        previousRoundScore = value
    }
    
    func toggleIsTurn() {
        isTurn.toggle()
    }
    
    func setDartCount(value: Int) {
        dartCount = value
    }
    
    func setDidWin(won: Bool) {
        didWin = won
    }
    
    func getDidWin() -> Bool {
        return didWin
    }
    
}

// Game Information
class X01GameViewModel: ObservableObject {
    @Published var player1: Player
    @Published var player2: Player
    
    private var startingX01Points: Int
    private var gameOver: Bool
    @Published var showingAlert = false
    
    init(startingX01Points: Int, player1Name: String="Player 1", player2Name: String="Player 2") {
        
        self.startingX01Points = startingX01Points
        self.gameOver = false
        
        self.player1 = Player(name: player1Name, isTurn: true, X01Points: startingX01Points)
        self.player2 = Player(name: player2Name, isTurn: false, X01Points: startingX01Points)
        
    }
    
    
    func getPlayer1() -> Player {
        return self.player1
    }

    func getPlayer2() -> Player {
        return self.player2
    }
    
    func getCurrentPlayer() -> Player {
        
        if (self.player1.getIsTurn()) {
            return self.player1
        }
        else {
            return self.player2
        }

    }
    
    func numberButtonCallback(player: Player, value: Int) {
        
        if player.getIsTurn() {
            dartThrow(player: player, pointVal: value)
        }
        
    }
    
    func resetDartCounts() {
        getPlayer1().setDartCount(value: 3)
        getPlayer2().setDartCount(value: 3)
    }
    
    func dartThrow(player: Player, pointVal: Int) {
        
        if (player.getDartCount() != 0) {
            
            let updatedRoundScore = player.getCurrentRoundScore() + pointVal
            let pointsLeft = player.getX01Points() - pointVal
            
            if (pointsLeft >= 0) {
            
                player.decreaseDartCount()
                player.setX01Points(value: pointsLeft)
                player.setCurrentRoundScore(value: updatedRoundScore)
            }
            else {
                endOfTurn(player: player)
                player.setDartCount(value: 3)
            }
        }
        
        if (player.getDartCount() == 0) {
            
            player.setPreviousRoundScore(value: player.getX01Points())
            endOfTurn(player: player)
        }
        
        gameOver = IsGameOver()
    }
    
    func endOfTurn(player: Player) {
        if (getPlayer1().getIsTurn()) {
            player.toggleIsTurn()
            getPlayer2().toggleIsTurn()
            getPlayer2().setCurrentRoundScore(value: 0)
        }
        else {
            player.toggleIsTurn()
            getPlayer1().toggleIsTurn()
            getPlayer1().setCurrentRoundScore(value: 0)
            resetDartCounts()
        }
    }
    
    func IsGameOver() -> Bool {
        
        if (getPlayer1().getX01Points() == 0) {
            print("p1 won")
            showingAlert = true
            getPlayer1().setDidWin(won: true)
            return true
        }
        else if (getPlayer2().getX01Points() == 0) {
            print("p2 won")
            showingAlert = true
            getPlayer2().setDidWin(won: true)
            return true
        }
        
        return false
    }
        
    
}

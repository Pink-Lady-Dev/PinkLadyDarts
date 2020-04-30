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
    private var backButtonStack: Stack
    @Published var showingAlert = false
    
    init(startingX01Points: Int, player1Name: String="Player 1", player2Name: String="Player 2") {
        
        self.startingX01Points = startingX01Points
        self.gameOver = false
        
        self.player1 = Player(name: player1Name, isTurn: true, X01Points: startingX01Points)
        self.player2 = Player(name: player2Name, isTurn: false, X01Points: startingX01Points)
        
        self.backButtonStack = Stack()
        
        
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
    
    func nextButtonCallback() {
        
        if (getPlayer1().getIsTurn()) {
            getPlayer1().setPreviousRoundScore(value: getPlayer1().getX01Points())
            endOfTurn(player: getPlayer1())
            getPlayer1().setDartCount(value: 3)
        }
        else {
            getPlayer2().setPreviousRoundScore(value: getPlayer2().getX01Points())
            endOfTurn(player: getPlayer2())
        }
    }
    
    func backButtonCallback() throws {
        
        if (backButtonStack.empty()) {
            throw X01GameError.invalidUndo(errorMsg: "Empty Stack. Cannot Undo")
        }
        
        do {
            
            let dart = try backButtonStack.pop()
            
            if dart.first?.key == "P1" {
                
                if (!getPlayer1().getIsTurn()) {
                    getPlayer1().toggleIsTurn()
                    getPlayer2().toggleIsTurn()
                }
                
                let lastDartVal = dart["P1"]!
                
                getPlayer1().setX01Points(value: getPlayer1().getX01Points() + lastDartVal)
                getPlayer1().setCurrentRoundScore(value: getPlayer1().getCurrentRoundScore() - lastDartVal)
                getPlayer1().setDartCount(value: getPlayer1().getDartCount() + 1)

            }
            else {
                
                if (getPlayer1().getIsTurn()) {
                    getPlayer1().toggleIsTurn()
                    getPlayer2().toggleIsTurn()
                }
                
                let lastDartVal = dart["P2"]!
                
                getPlayer2().setX01Points(value: getPlayer2().getX01Points() + lastDartVal)
                getPlayer2().setCurrentRoundScore(value: getPlayer2().getCurrentRoundScore() - lastDartVal)
                getPlayer2().setDartCount(value: getPlayer2().getDartCount() + 1)
            }
            
        } catch {
            print(error)
        }
    }
    
    func resetDartCounts() {
        getPlayer1().setDartCount(value: 3)
        getPlayer2().setDartCount(value: 3)
    }
    
    func dartThrow(player: Player, pointVal: Int) {
        
        if (player.getDartCount() != 0) {
            
            if (getPlayer1().getIsTurn()) {
                backButtonStack.push(["P1" : pointVal])
            }
            else {
                backButtonStack.push(["P2" : pointVal])
            }
            
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
        
    // Stack for darts thrown
    struct Stack {
        private var items: [[String: Int]] = []
        
        func printStack() {
            for item in items {
                print(item)
            }
        }
        
        func peek() -> [String: Int] {
            guard let topElement = items.first else { fatalError("This stack is empty.") }
            return topElement
        }
        
        mutating func pop() throws -> [String: Int] {
            
            if items.count == 0 {
                throw X01GameError.emptyStack(errorMsg: "ERROR: Empty Stack")
            }
            else {
                return items.removeFirst()
            }
            
        }
        
        mutating func push(_ element: [String: Int]) {
            items.insert(element, at: 0)
        }
        
        func empty() -> Bool {
            return items.count == 0
        }
    }

    // Errors for X01 Game Mode
    enum X01GameError: Error {
        case emptyStack(errorMsg: String)
        case invalidUndo(errorMsg: String)
    }
}





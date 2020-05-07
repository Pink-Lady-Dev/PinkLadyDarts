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
    
    // [(PlayerID, dartValue, X01Points, CurrentRoundScore, PreviousRoundScore)]
    private var tupleStack: TupleStack
    
    init(startingX01Points: Int, player1Name: String="Player 1", player2Name: String="Player 2") {
        
        self.startingX01Points = startingX01Points
        self.gameOver = false
        
        self.player1 = Player(name: player1Name, isTurn: true, X01Points: startingX01Points)
        self.player2 = Player(name: player2Name, isTurn: false, X01Points: startingX01Points)
        
        self.tupleStack = TupleStack()
        
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
        
        // Clicking the next button is the equivalent of
        // missing your remaining throws currently
        
        if (getPlayer1().getIsTurn()) {
            for _ in 1...getPlayer1().getDartCount() {
                dartThrow(player: getPlayer1(), pointVal: 0)
            }
        }
        else {
            for _ in 1...getPlayer2().getDartCount() {
                dartThrow(player: getPlayer2(), pointVal: 0)
            }
        }
    }
    
    func backButtonCallback() throws {
        
        // If the Stack is empty it is the very first turn
        // no darts have technically been thrown yet
        
        if (tupleStack.empty()) {
            throw X01GameError.invalidUndo(errorMsg: "Empty Stack. Cannot Undo")
        }
        
        do {
            // [(PlayerID, dartValue, X01Points, CurrentRoundScore, PreviousRoundScore)]
            let dart = try tupleStack.pop()
            
            if (dart.0 == "P1") {
                
                if (isPlayer1Turn()) {
                    getPlayer1().setX01Points(value: dart.2 + dart.1)
                    getPlayer1().setCurrentRoundScore(value: dart.3 - dart.1)
                    getPlayer1().setDartCount(value: getPlayer1().getDartCount() + 1)
                }
                else {
                    switchTurns()
                    getPlayer1().setX01Points(value: dart.2 + dart.1)
                    getPlayer1().setCurrentRoundScore(value: dart.3 - dart.1)
                    getPlayer1().setPreviousRoundScore(value: dart.4)
                    
                    if getPlayer1().getDartCount() != 0 {
                        getPlayer1().setDartCount(value: 0)
                    }
                    
                    getPlayer1().setDartCount(value: getPlayer1().getDartCount() + 1)
                }
                
            }
            else {
                
                if (isPlayer2Turn()) {
                    getPlayer2().setX01Points(value: dart.2 + dart.1)
                    getPlayer2().setCurrentRoundScore(value: dart.3 - dart.1)
                    getPlayer2().setDartCount(value: getPlayer2().getDartCount() + 1)
                }
                else {
                    switchTurns()
                    getPlayer2().setX01Points(value: dart.2 + dart.1)
                    getPlayer2().setCurrentRoundScore(value: dart.3 - dart.1)
                    getPlayer2().setPreviousRoundScore(value: dart.4)
                    
                    if getPlayer2().getDartCount() != 0 {
                        getPlayer2().setDartCount(value: 0)
                    }
                    
                    getPlayer2().setDartCount(value: getPlayer2().getDartCount() + 1)
                }
                
            }
        }
        catch {
            print(error)
        }
        
        
    }
    
    func resetDartCounts() {
        getPlayer1().setDartCount(value: 3)
        getPlayer2().setDartCount(value: 3)
    }
    
    func dartThrow(player: Player, pointVal: Int) {
        
        if (player.getDartCount() != 0) {
            
            var turn: (String, Int, Int, Int, Int)
            
            if (getPlayer1().getIsTurn()) {
                turn.0 = "P1"
            }
            else {
                turn.0 = "P2"
            }
            
            turn.1 = pointVal
            
            let updatedRoundScore = player.getCurrentRoundScore() + pointVal
            let pointsLeft = player.getX01Points() - pointVal
            
            if (pointsLeft >= 0) {
                
                player.decreaseDartCount()
                player.setX01Points(value: pointsLeft)
                player.setCurrentRoundScore(value: updatedRoundScore)
                
                // [(PlayerID, dartValue, X01Points, CurrentRoundScore, PreviousRoundScore)]
                turn.2 = pointsLeft
                turn.3 = updatedRoundScore
                turn.4 = player.getPreviousRoundScore()
                tupleStack.push(turn)
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
            getPlayer2().setDartCount(value: 3)
        }
        else {
            player.toggleIsTurn()
            getPlayer1().toggleIsTurn()
            getPlayer1().setCurrentRoundScore(value: 0)
            getPlayer1().setDartCount(value: 3)
        }
    }
    
    func isPlayer1Turn() -> Bool{
        return getPlayer1().getIsTurn()
    }
    
    func isPlayer2Turn() -> Bool {
        return getPlayer2().getIsTurn()
    }
    
    func switchTurns() {
        getPlayer1().toggleIsTurn()
        getPlayer2().toggleIsTurn()
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
    
    // Errors for X01 Game Mode
    enum X01GameError: Error {
        case emptyStack(errorMsg: String)
        case invalidUndo(errorMsg: String)
    }
    
    struct TupleStack {
        private var items: [(String, Int, Int, Int, Int)] = []
        
        func printStack() {
            for item in items {
                print(item)
            }
        }
        
        func peek() -> (String, Int, Int, Int, Int) {
            guard let topElement = items.first else { fatalError("This stack is empty.") }
            return topElement
        }
        
        mutating func pop() throws -> (String, Int, Int, Int, Int) {
            
            if items.count == 0 {
                throw X01GameError.emptyStack(errorMsg: "ERROR: Empty Stack")
            }
            else {
                return items.removeFirst()
            }
            
        }
        
        mutating func push(_ element: (String, Int, Int, Int, Int)) {
            items.insert(element, at: 0)
        }
        
        func empty() -> Bool {
            return items.count == 0
        }
    }
    
}

//
//  X01GameViewModel.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 4/15/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//


import Foundation
import Combine
import SwiftUI

// TODO:
// add support to track single, double, triples
//

class X01GameViewModel: GameViewModel {

    @Published var showingAlert = false
    private var startingX01Points: Int

    
    // [(PlayerID, dartValue, X01Points, CurrentRoundScore, PreviousRoundScore)]
    private var tupleStack: TupleStack
    
    
    init(startingX01Points: Int) {
  
        self.startingX01Points = startingX01Points
        self.tupleStack = TupleStack()
        super.init(startingPoints: self.startingX01Points)
    
    }
    
    override func buttonCallback(btnVal: Int, multiplier: Int) {
       
        let generator = UIImpactFeedbackGenerator(style: .medium)

        generator.impactOccurred()
        
        var player: Player
        
        if (isPlayerTurn(playerID: 1)) {
            player = getPlayer(playerID: 1)
        }
        else {
            player = getPlayer(playerID: 2)
        }
        
        
        if (btnVal == 25) {
            numberButtonCallback(player: player, value: 25)
        }
        else if (btnVal == 50) {
            numberButtonCallback(player: player, value: 50)
        }
        else {
            let adjustedVal = btnVal * multiplier
            numberButtonCallback(player: player, value: adjustedVal)
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
        
        if (getPlayer(playerID: 1).getIsTurn()) {
            for _ in 1...getPlayer(playerID: 1).getDartCount() {
                dartThrow(player: getPlayer(playerID: 1), pointVal: 0)
            }
        }
        else {
            for _ in 1...getPlayer(playerID: 2).getDartCount() {
                dartThrow(player: getPlayer(playerID: 2), pointVal: 0)
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
                
                if (isPlayerTurn(playerID: 1)) {
                    getPlayer(playerID: 1).setStartingPoints(value: dart.2 + dart.1)
                    getPlayer(playerID: 1).setCurrentRoundScore(value: dart.3 - dart.1)
                    getPlayer(playerID: 1).setDartCount(value: getPlayer(playerID: 1).getDartCount() + 1)
                }
                else {
                    switchTurns()
                    getPlayer(playerID: 1).setStartingPoints(value: dart.2 + dart.1)
                    getPlayer(playerID: 1).setCurrentRoundScore(value: dart.3 - dart.1)
                    getPlayer(playerID: 1).setPreviousRoundScore(value: dart.4)
                    
                    if getPlayer(playerID: 1).getDartCount() != 0 {
                        getPlayer(playerID: 1).setDartCount(value: 0)
                    }
                    
                    getPlayer(playerID: 1).setDartCount(value: getPlayer(playerID: 1).getDartCount() + 1)
                }
                
            }
            else {
                
                if (isPlayerTurn(playerID: 2)) {
                    getPlayer(playerID: 2).setStartingPoints(value: dart.2 + dart.1)
                    getPlayer(playerID: 2).setCurrentRoundScore(value: dart.3 - dart.1)
                    getPlayer(playerID: 2).setDartCount(value: getPlayer(playerID: 2).getDartCount() + 1)
                }
                else {
                    switchTurns()
                    getPlayer(playerID: 2).setStartingPoints(value: dart.2 + dart.1)
                    getPlayer(playerID: 2).setCurrentRoundScore(value: dart.3 - dart.1)
                    getPlayer(playerID: 2).setPreviousRoundScore(value: dart.4)
                    
                    if getPlayer(playerID: 2).getDartCount() != 0 {
                        getPlayer(playerID: 2).setDartCount(value: 0)
                    }
                    
                    getPlayer(playerID: 2).setDartCount(value: getPlayer(playerID: 2).getDartCount() + 1)
                }
                
            }
        }
        catch {
            print(error)
        }
        
        
    }
    
    func resetDartCounts() {
        getPlayer(playerID: 1).setDartCount(value: 3)
        getPlayer(playerID: 2).setDartCount(value: 3)
    }
    
    func dartThrow(player: Player, pointVal: Int) {
        
        if (player.getDartCount() != 0) {
            
            var turn: (String, Int, Int, Int, Int)
            
            if (getPlayer(playerID: 1).getIsTurn()) {
                turn.0 = "P1"
            }
            else {
                turn.0 = "P2"
            }
            
            turn.1 = pointVal
            
            let updatedRoundScore = player.getCurrentRoundScore() + pointVal
            let pointsLeft = player.getStartingPoints() - pointVal
            
            if (pointsLeft >= 0) {
                
                player.decreaseDartCount()
                player.setStartingPoints(value: pointsLeft)
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
            
            player.setPreviousRoundScore(value: player.getStartingPoints())
            endOfTurn(player: player)
        }

        GameOver()
 
    }
    
    func endOfTurn(player: Player) {
        if (getPlayer(playerID: 1).getIsTurn()) {
            player.toggleIsTurn()
            getPlayer(playerID: 2).toggleIsTurn()
            getPlayer(playerID: 2).setCurrentRoundScore(value: 0)
            getPlayer(playerID: 2).setDartCount(value: 3)
        }
        else {
            player.toggleIsTurn()
            getPlayer(playerID: 1).toggleIsTurn()
            getPlayer(playerID: 1).setCurrentRoundScore(value: 0)
            getPlayer(playerID: 1).setDartCount(value: 3)
        }
    }
    
    func switchTurns() {
        getPlayer(playerID: 1).toggleIsTurn()
        getPlayer(playerID: 2).toggleIsTurn()
    }
    
    func GameOver() {
        
        if (getPlayer(playerID: 1).getStartingPoints() == 0) {
            print("p1 won")
            showingAlert = true
            getPlayer(playerID: 1).setDidWin(won: true)
        }
        else if (getPlayer(playerID: 2).getStartingPoints() == 0) {
            print("p2 won")
            showingAlert = true
            getPlayer(playerID: 2).setDidWin(won: true)
        }

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

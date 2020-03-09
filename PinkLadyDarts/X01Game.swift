//
//  X01Game.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/11/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation
import SwiftUI

// Things to do: not needed but good to have
// 1. Randomize p1/p2 order at start of game
// 2. Use a stack for the back button, store last 3 throws so you can always undo the entire turn
class X01Game: ObservableObject
{
    // This is the target score (e.g. 301, 501, etc.)
    private var X01Mode: Int
    
    // This is the score that is left to win the game
    @Published private var p1PointsLeft: Int
    @Published private var p2PointsLeft: Int
    
    // boolean for tracking which players turn it is
    @Published private var isP1Turn: Bool = true
    
    // This is the score at the start of each round, doesn't change until the start of the next turn
    @Published private var p1prevRoundScore: Int
    @Published private var p2prevRoundScore: Int
    
    @Published private var p1Won: Bool
    @Published private var p2Won: Bool
    
    @Published private var player1Name: String
    @Published private var player2Name: String
    
    // Initializer, set all points to starting values
    init(targetPoints: Int, p1Name: String = "Player 1", p2Name: String = "Player 2")
    {
        X01Mode = targetPoints
        
        p1PointsLeft = X01Mode
        p2PointsLeft = X01Mode
        
        p1prevRoundScore = X01Mode
        p2prevRoundScore = X01Mode
        
        p1Won = false
        p2Won = false
        
        player1Name = p1Name
        player2Name = p2Name
        
    }
    
    @Published private var p1CurrentRoundScore: Int = 0
    @Published private var p2CurrentRoundScore: Int = 0
    @Published private var p1DartsLeft: Int = 3
    @Published private var p2DartsLeft: Int = 3
    @Published private var currentRound: Int = 1
    
    @Published var showingAlert = false
    
    
    @Published var dartHistroy = Stack()
    
    func resetP1DartsLeft()
    {
        p1DartsLeft = 3
    }
    
    func resetP2DartsLeft()
    {
        p2DartsLeft = 3
    }
    
    func addP1DartsLeft()
    {
        if p1DartsLeft < 3
        {
            p1DartsLeft += 1
        }
        
    }
    
    func addP2DartsLeft()
    {
        if p2DartsLeft < 3
        {
            p2DartsLeft += 1
        }
        
    }
    
    func getP1DartsLeft() -> Int
    {
        return p1DartsLeft
    }
    
    func getP2DartsLeft() -> Int
    {
        return p2DartsLeft
    }
    
    func decreaseP1DartsLeft()
    {
        p1DartsLeft -= 1
    }
    
    func decreaseP2DartsLeft()
    {
        p2DartsLeft -= 1
    }
    
    // this all needs to be rewritten
    func dartThrow(val: Int)
    {
        if (getIsP1Turn())
        {
            if (getP1DartsLeft() > 0)
            {
                if ((getP1PointsLeft() - val) < 0)
                {
                    toggleIsP1Turn()
                }
                else if ((getP1PointsLeft() - val) == 0)
                {
                    setP1CurrentRoundScore(points: val)
                    setP1PointsLeft(points: val)
                    decreaseP1DartsLeft()
                    
                    showingAlert = true
                    setP1Won()
                }
                else
                {
                    setP1CurrentRoundScore(points: val)
                    setP1PointsLeft(points: val)
                    decreaseP1DartsLeft()
                    
                    dartHistroy.push(["P1":val])
                    
                    if getP1DartsLeft() == 0 {
                       toggleIsP1Turn()
                    }
                }
            }
            
        }
        else
        {
            if (getP2DartsLeft() > 0)
            {
                if ((getP2PointsLeft() - val) < 0)
                {
                    toggleIsP1Turn()
                }
                else if ((getP2PointsLeft() - val) == 0)
                {
                    setP2CurrentRoundScore(points: val)
                    setP2PointsLeft(points: val)
                    decreaseP2DartsLeft()
                    
                    showingAlert = true
                    setP2Won()
                }
                else
                {
                    setP2CurrentRoundScore(points: val)
                    setP2PointsLeft(points: val)
                    decreaseP2DartsLeft()
                    
                    dartHistroy.push(["P2":val])
                    
                    if getP2DartsLeft() == 0 {
                       toggleIsP1Turn()
                    }
                    
                }
                
            }
        }
    }
    
    // handle back button click
    func backButtonClick() throws
    {
        if currentRound == 1 && getP1DartsLeft() == 3 {
            throw X01GameError.invalidUndo(errorMsg: "Cannot undo on first throw of the first round")
        }
        
        do {
            
            let dart = try dartHistroy.pop()
            
            if dart.first?.key == "P1" {
                
                if (!getIsP1Turn()) {
                    isP1Turn.toggle()
                }
                
                let lastDartVal = dart["P1"]!
                
                self.setP1PointsLeft(points: -(lastDartVal))
                self.addP1DartsLeft()
            }
            else
            {
                if (getIsP1Turn()) {
                    isP1Turn.toggle()
                }
                
                // have to step back a round
                currentRound -= 1
                print("Going back to round \(currentRound)")
                
                let lastDartVal = dart["P2"]!
                
                self.setP2PointsLeft(points: -(lastDartVal))
                self.addP2DartsLeft()
            }
            
        } catch {
            print(error)
        }
    }
    
    func getIsP1Turn() -> Bool
    {
        return isP1Turn
    }
    
    func toggleIsP1Turn()
    {
        if !getIsP1Turn() {
            currentRound += 1
            print("Starting round: \(currentRound)")
        }
        
        if getP1DartsLeft() == 0 && getP2DartsLeft() == 0
        {
            resetP1DartsLeft()
            resetP2DartsLeft()
        }
        
        isP1Turn.toggle()
    }
    
    func getPlayer1Name() -> String
    {
        return player1Name
    }
    
    func getPlayer2Name() -> String
    {
        return player2Name
    }
    
    func setP1Won() {
        showingAlert = true
        self.p1Won = true
    }
    
    func getP1Won() -> Bool{
        return self.p1Won
    }
    
    func setP2Won() {
        showingAlert = true
        self.p2Won = true
    }
    
    func getP2Won() -> Bool {
        return self.p2Won
    }
    
    // updates things on switching BACK to player
    func nextTurn()
    {
        if (getIsP1Turn())
        {
            
            resetP2CurrentRoundScore()
            setP2prevRoundScore(points: getP2PointsLeft())
        }
        else
        {
            resetP1CurrentRoundScore()
            setP1prevRoundScore(points: getP1PointsLeft())
        }
        
        toggleIsP1Turn()
        
        
    }
    
    func resetP1CurrentRoundScore()
    {
        p1CurrentRoundScore = 0
    }
    
    func resetP2CurrentRoundScore()
    {
        p2CurrentRoundScore = 0
    }
    
    func getP1PointsLeft() -> Int
    {
        return p1PointsLeft
    }
    
    func getP2PointsLeft() -> Int
    {
        return p2PointsLeft
    }
    
    func setP1PointsLeft(points: Int)
    {
        p1PointsLeft -= points
    }
    
    func setP2PointsLeft(points: Int)
    {
        p2PointsLeft -= points
    }
    
    func setP1CurrentRoundScore(points: Int)
    {
        p1CurrentRoundScore += points
    }
    
    func setP2CurrentRoundScore(points: Int)
    {
        p2CurrentRoundScore += points
    }
    
    func getP1CurrentRoundScore() -> Int
    {
        return p1CurrentRoundScore
    }
    
    func getP2CurrentRoundScore() -> Int
    {
        return p2CurrentRoundScore
    }
    
    func getP1prevRoundScore() -> Int
    {
        return p1prevRoundScore
    }
    
    func getP2prevRoundScore() -> Int
    {
        return p2prevRoundScore
    }
    
    func setP1prevRoundScore(points: Int)
    {
        p1prevRoundScore = points
    }
    
    func setP2prevRoundScore(points: Int)
    {
        p2prevRoundScore = points
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
    }
    
    // Errors for X01 Game Mode
    enum X01GameError: Error {
        case emptyStack(errorMsg: String)
        case invalidUndo(errorMsg: String)
    }
    
}




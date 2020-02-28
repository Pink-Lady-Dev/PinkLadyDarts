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
// 2. Use a stack or queue for the back button, store last 3 throws so you can always undo the entire turn


class X01Game: Game
{
    // This is the target score (e.g. 301, 501, etc.)
    private var X01Mode: Int
    
    // This is the score that is left to win the game
    @Published private var p1PointsLeft: Int
    @Published private var p2PointsLeft: Int
    
    // This is the score at the start of each round, doesn't change until the start of the next turn
    @Published private var p1prevRoundScore: Int
    @Published private var p2prevRoundScore: Int
    
    @Published private var p1Won: Bool
    @Published private var p2Won: Bool
    
    // Initializer, set all points to starting values
    init(targetPoints: Int)
    {
        X01Mode = targetPoints
        
        p1PointsLeft = X01Mode
        p2PointsLeft = X01Mode
        
        p1prevRoundScore = X01Mode
        p2prevRoundScore = X01Mode
        
        p1Won = false
        p2Won = false
        
    }
    
    @Published private var p1CurrentRoundScore: Int = 0
    @Published private var p2CurrentRoundScore: Int = 0
    @Published private var prevTurns = Stack()
    
    @Published var showingAlert = false
    @Published var showNameInputAlert = false
    
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
        
        mutating func pop() -> [String: Int] {
            return items.removeFirst()
        }
      
        mutating func push(_ element: [String: Int]) {
            items.insert(element, at: 0)
        }
    }
    
    // little bit of logic for ya
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
                    prevTurns.push(["P1": val])
                    
                    if getP1DartsLeft() == 0
                    {
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
                    prevTurns.push(["P2": val])
                    
                    if getP2DartsLeft() == 0
                    {
                        toggleIsP1Turn()
                    }
                }
                
            }
        }
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
    
    func backButtonClick()
    {
        let dart = prevTurns.pop()
        
        if dart.first?.key == "P1" {
            let lastDartVal = dart["P1"]!
            
            undoP1Throw(updatedPoints: lastDartVal)

            
        }
            
//        prevTurns.printStack()
        
    }
    
    func undoP1Throw(updatedPoints: Int) {
        p1PointsLeft += updatedPoints
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
        
        
        if (getIsP1Turn())
        {
            resetP1DartsLeft()
        }
        else
        {
            resetP2DartsLeft()
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
    
    func getX01_mode() -> Int
    {
        return X01Mode
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
    
}



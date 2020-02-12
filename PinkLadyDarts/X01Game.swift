//
//  X01Game.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/11/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

// Things to do: not needed but good to have
// 1. Randomize p1/p2 order at start of game
// 2. Use a stack or queue for the back button, store last 3 throws so you can always undo the entire turn


class X01Game: ObservableObject
{
    // This is the target score (e.g. 301, 501, etc.)
    private var X01Mode: Int
    
    // This is the score that is left to win the game
    @Published private var p1PointsLeft: Int
    @Published private var p2PointsLeft: Int
    
    // This is the score at the start of each round, doesn't change until the start of the next turn
    @Published private var p1prevRoundScore: Int
    @Published private var p2prevRoundScore: Int
    
    // Initializer, set all points to starting values
    init(targetPoints: Int)
    {
        X01Mode = targetPoints
        
        p1PointsLeft = X01Mode
        p2PointsLeft = X01Mode
        
        p1prevRoundScore = X01Mode
        p2prevRoundScore = X01Mode
    }
    
    
    
    @Published private var player1Name: String = "Player 1"
    @Published private var p1CurrentRoundScore: Int = 0
    
    @Published private var player2Name: String = "Player 2"
    @Published private var p2CurrentRoundScore: Int = 0
    
    // boolean for tracking which players turn it is
    @Published private var isP1Turn: Bool = true
    
    @Published private var dartsLeft: Int = 3
    
    
    // little bit of logic for ya
    func dartThrow(val: Int)
    {
        if (isP1Turn)
        {
            
            if (dartsLeft > 0)
            {
                setP1CurrentRoundScore(points: val)
                setP1PointsLeft(points: val)
                decreaseDartsLeft()
            }
            
        }
        else
        {
            if (dartsLeft > 0)
            {
                setP2CurrentRoundScore(points: val)
                setP2PointsLeft(points: val)
                decreaseDartsLeft()
            }
        }
    }
    
    func switchPlayers()
    {
        if (getIsP1Turn())
        {
            resetP2CurrentRoundScore()
        }
        else
        {
            resetP1CurrentRoundScore()
        }
        
        toggleIsP1Turn()
        resetDartsLeft()
    }
    
    func resetDartsLeft()
    {
        dartsLeft = 3
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
    
    func getPlayer1Name() -> String
    {
        return player1Name
    }
    
    func getPlayer2Name() -> String
    {
        return player2Name
    }
    
    func setPlayer1Name(name: String)
    {
        player1Name = name
    }
    
    func setPlayer2Name(name: String)
    {
        player2Name = name
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
        p1prevRoundScore -= points
    }
    
    func setP2prevRoundScore(points: Int)
    {
        p2prevRoundScore -= points
    }
    
    func getIsP1Turn() -> Bool
    {
        return isP1Turn
    }
    
    func toggleIsP1Turn()
    {
        isP1Turn.toggle()
    }
    
    func getDartsLeft() -> Int
    {
        return dartsLeft
    }
    
    func decreaseDartsLeft()
    {
        dartsLeft -= 1
    }
    
    
}



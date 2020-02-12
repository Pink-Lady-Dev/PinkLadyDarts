//
//  X01Game.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/11/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

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
    
}



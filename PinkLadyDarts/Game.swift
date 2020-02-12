//
//  Game.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/12/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

class Game: ObservableObject
{
    
    init()
    {
        
    }
    
    @Published private var player1Name: String = "Player 1"
    
    
    @Published private var player2Name: String = "Player 2"
    
    
    // boolean for tracking which players turn it is
    @Published private var isP1Turn: Bool = true
    
    @Published private var p1DartsLeft: Int = 3
    @Published private var p2DartsLeft: Int = 3
    
    func resetP1DartsLeft()
    {
        p1DartsLeft = 3
    }
    func resetP2DartsLeft()
    {
        p2DartsLeft = 3
    }
    
    func getP1DartsLeft() -> Int
    {
        return p1DartsLeft
    }
    func getP2DartsLeft() -> Int
    {
        return p2DartsLeft
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
    
    func getIsP1Turn() -> Bool
    {
        return isP1Turn
    }
    
    func toggleIsP1Turn()
    {
        isP1Turn.toggle()
    }
    
    func decreaseP1DartsLeft()
    {
        p1DartsLeft -= 1
    }
    
    func decreaseP2DartsLeft()
    {
        p2DartsLeft -= 1
    }
}

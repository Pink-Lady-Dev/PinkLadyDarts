//
//  GameViewModel.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 5/23/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

// button callback that is overridable
// players arary?
//

class GameViewModel: ObservableObject {
    
    
    @Published var players: [Player]
    
    private var numPlayers: Int
    private var playerNames: [String]
    private var gameOver: Bool
    private var startingPoints: Int
    
    init(numPlayers: Int=2, playerNames: [String]=["Player 1", "Player 2"], startingPoints: Int) {
        
        self.numPlayers = numPlayers
        self.playerNames = playerNames
        self.players = [Player]()
        self.gameOver = false
        self.startingPoints = startingPoints
        
        for name in 0..<numPlayers {
            if (name == 0) {
                players.append(Player(name: playerNames[name], isTurn: true, startingPoints: self.startingPoints))
            }
            else {
                players.append(Player(name: playerNames[name], isTurn: false, startingPoints: self.startingPoints))
            }
        }
        
    }
    
    // Override in subclass
    func buttonCallback(btnVal: Int, multiplier: Int) {
        print("Default Callback")
    }
    
    // returns the player at the specified index
    // in the players array
    func getPlayer(playerID: Int) -> Player {
        return players[playerID-1]
    }
    
    // returns if it is the specified players turn
    func isPlayerTurn(playerID: Int) -> Bool {
        return getPlayer(playerID: playerID).getIsTurn()
    }
    
    //
    func toggleGameOver() {
        gameOver.toggle()
    }
    
    // access for private var gameOver
    func isGameOver() -> Bool {
        return gameOver
    }
    
    

}

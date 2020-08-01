//
//  Player.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 5/23/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

// Player Specific Information
class Player: ObservableObject {
    private var name: String
    private var isTurn: Bool
    private var currentRoundScore: Int
    private var startingPoints: Int
    private var previousRoundScore: Int
    private var dartCount: Int
    private var didWin: Bool
    
    init(name: String, isTurn: Bool, startingPoints: Int) {
        self.name = name
        self.isTurn = isTurn
        self.currentRoundScore = 0
        self.startingPoints = startingPoints
        self.previousRoundScore = startingPoints
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
    
    func getStartingPoints() -> Int {
        return startingPoints
    }
    
    func setStartingPoints(value: Int) {
        startingPoints = value
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

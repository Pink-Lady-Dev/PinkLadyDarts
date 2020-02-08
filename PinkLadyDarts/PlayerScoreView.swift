//
//  PlayerScoreView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct PlayerScoreView: View {
    
    enum playerID {
        case player1, player2
    }
    
    var pointsLeft: Int
    var prevRoundScore: Int = 301
    var currentRoundPoints: Int = 0
    var playerName: String
    var id: playerID
    
    var body: some View {
        
        ZStack {
            Rectangle().fill(Color.gray)
            
            // layout for player 1 score view (left side of screen)
            if id == .player1 {
                HStack {
                    VStack{
                        HStack {
                            Text(String(prevRoundScore))
                            Text(String(currentRoundPoints))
                        }
                        Text(playerName)
                    }
                    HStack {
                        Text(String(pointsLeft))
                    }
                }
            }
            // layout for player 1 score view (left side of screen)
            else {
                HStack {
                    HStack {
                        Text(String(pointsLeft))
                    }
                    VStack{
                        HStack {
                            Text(String(currentRoundPoints))
                            Text(String(prevRoundScore))
                        }
                        Text(playerName)
                    }
                    
                }
            }
            
            
        }.border(Color.black, width: 1)
        
    }
}

struct PlayerScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScoreView(pointsLeft: 301, playerName: "Nick", id: .player1)
    }
}

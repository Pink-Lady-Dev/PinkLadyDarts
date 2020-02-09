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
    var turnHighlightColor: Color = Color.gray
    
    var body: some View {
        
        ZStack {
            Rectangle().fill(turnHighlightColor)
            
            // layout for player 1 score view (left side of screen)
            if id == .player1 {
                HStack {
                    VStack(alignment: .leading){
                        HStack {
                            Text(String(prevRoundScore)).strikethrough()
                            Text(String(currentRoundPoints)).frame(width: 50).border(Color.black, width: 1)
                        }
                        Text(playerName).font(.title).fontWeight(.medium)
                    }.frame(maxWidth: .infinity)
                    HStack {
                        Text(String(pointsLeft)).font(.title).padding()
                    }
                }
            }
            // layout for player 1 score view (left side of screen)
            else {
                HStack {
                    HStack {
                        Text(String(pointsLeft)).font(.title).padding()
                    }
                    VStack(alignment: .trailing){
                        HStack {
                            Text(String(currentRoundPoints)).frame(width: 50).border(Color.black, width: 1)
                            Text(String(prevRoundScore)).strikethrough()
                        }
                        Text(playerName).font(.title).fontWeight(.medium)
                    }.frame(maxWidth: .infinity)
                    
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

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
    
    //var pointsLeft: Int
    //var prevRoundScore: Int = 301
    //var currentRoundPoints: Int = 0
    //var playerName: String
    var id: playerID
    var turnHighlightColor: Color = Color.gray
    
    @ObservedObject var myGame: X01Game
    
    
    var body: some View {
        
        ZStack {
            Rectangle().fill(turnHighlightColor)
            
            // layout for player 1 score view (left side of screen)
            if id == .player1 {
                HStack {
                    VStack(alignment: .leading){
                        HStack {
                            Text(String(self.myGame.getP1prevRoundScore())).strikethrough()
                            Text(String(self.myGame.getP1CurrentRoundScore())).frame(width: 50).border(Color.black, width: 1) // box = points score that round
                        }
                        Text(self.myGame.getPlayer1Name()).font(.title).fontWeight(.medium)
                    }.frame(maxWidth: .infinity)
                    HStack {
                        Text(String(self.myGame.getP1PointsLeft())).font(.title).padding()
                    }
                }
            }
            // layout for player 1 score view (left side of screen)
            else {
                HStack {
                    HStack {
                        Text(String(self.myGame.getP2PointsLeft())).font(.title).padding()
                    }
                    VStack(alignment: .trailing){
                        HStack {
                            Text(String(self.myGame.getP2CurrentRoundScore())).frame(width: 50).border(Color.black, width: 1)
                            Text(String(self.myGame.getP2prevRoundScore())).strikethrough()
                        }
                        Text(self.myGame.getPlayer2Name()).font(.title).fontWeight(.medium)
                    }.frame(maxWidth: .infinity)
                    
                }
            }
            
            
        }.border(Color.black, width: 1)
        
    }
}

struct PlayerScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScoreView(id: .player1, myGame: X01Game(targetPoints: 301))
    }
}

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
    
    var id: playerID
    var turnHighlightColor: Color = (Color.red)
    
    @ObservedObject var myGame: X01Game
    
    
    var body: some View {
        /*
         ZStack {
         if (self.myGame.getIsP1Turn())
         {
         Rectangle().fill(turnHighlightColor)
         }
         
         // layout for player 1 score view (left side of screen)
         if id == .player1 {
         if (self.myGame.getIsP1Turn())
         {
         Rectangle().fill(turnHighlightColor)
         }
         else{
         //                    Rectangle().fill(LinearGradient(Color.darkStart, Color.darkEnd))
         RoundedRectangle(cornerRadius: 25)
         .fill(Color.offWhite)
         .frame(width: 300, height: 300)
         //                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
         //                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
         }
         
         HStack {
         VStack(alignment: .leading){
         HStack {
         Text(String(self.myGame.getP1prevRoundScore())).strikethrough()
         Text(String(self.myGame.getP1CurrentRoundScore())).frame(width: 50).border(Color.white, width: 1) // box = points score that round
         }
         Text(self.myGame.getPlayer1Name()).font(.title).fontWeight(.medium)
         }.frame(maxWidth: .infinity)
         HStack {
         VStack {
         Text(String(self.myGame.getP1PointsLeft())).font(.title).padding()
         Text(String(self.myGame.getP1DartsLeft()))
         }
         }
         }.foregroundColor(Color.white)
         }
         // layout for player 1 score view (left side of screen)
         else {
         
         if (!self.myGame.getIsP1Turn())
         {
         Rectangle().fill(turnHighlightColor)
         }
         else{
         //                    Rectangle().fill(LinearGradient(Color.darkStart, Color.darkEnd))
         RoundedRectangle(cornerRadius: 25)
         .fill(Color.offWhite)
         .frame(width: 300, height: 300)
         //                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
         //                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
         }
         
         
         HStack {
         HStack {
         VStack{
         Text(String(self.myGame.getP2PointsLeft())).font(.title).padding()
         Text(String(self.myGame.getP2DartsLeft()))
         }
         }
         VStack(alignment: .trailing){
         HStack {
         Text(String(self.myGame.getP2CurrentRoundScore())).frame(width: 50).border(Color.white, width: 1)
         Text(String(self.myGame.getP2prevRoundScore())).strikethrough()
         }
         Text(self.myGame.getPlayer2Name()).font(.title).fontWeight(.medium)
         }.frame(maxWidth: .infinity)
         
         }.foregroundColor(Color.white)
         }
         
         
         }.border(Color.black, width: 1)
         */
        
        ZStack {
            
            if id == .player1 {
                
                if (self.myGame.getIsP1Turn())
                {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(Color.lightEnd1, Color.lightStart1))
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(Color.lightStart1, Color.lightEnd1), lineWidth: 4))
                        .frame(width: 175, height: 125)
                        .shadow(color: Color.darkStart, radius: 5, x: -5, y: -5)
                        .shadow(color: Color.darkEnd, radius: 5, x: 5, y: 5)
                }
                else {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(Color.lightStart1, Color.lightEnd1), lineWidth: 4))
                        .frame(width: 175, height: 125)
                        .shadow(color: Color.darkStart, radius: 5, x: -5, y: -5)
                        .shadow(color: Color.darkEnd, radius: 5, x: 5, y: 5)
                }
                
                HStack {
                    VStack(alignment: .leading){
                        HStack {
                            Text(String(self.myGame.getP1prevRoundScore())).strikethrough()
                            Text(String(self.myGame.getP1CurrentRoundScore())).frame(width: 50).border(Color.white, width: 1) // box = points score that round
                        }
                        Text(self.myGame.getPlayer1Name()).font(.system(size: 24))
                    }.frame(maxWidth: .infinity)
                    HStack {
                        VStack {
                            Text(String(self.myGame.getP1PointsLeft())).padding()
                            Text(String(self.myGame.getP1DartsLeft()))
                        }
                    }
                }
                .font(.system(size: 12))
                .frame(width: 165, height: 110)
                .foregroundColor(Color.white)
            }
            else {
                
                if (!self.myGame.getIsP1Turn())
                {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(Color.lightEnd1, Color.lightStart1))
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(Color.lightStart1, Color.lightEnd1), lineWidth: 4))
                        .frame(width: 175, height: 125)
                        .shadow(color: Color.darkStart, radius: 5, x: -5, y: -5)
                        .shadow(color: Color.darkEnd, radius: 5, x: 5, y: 5)
                }
                else {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(LinearGradient(Color.lightStart1, Color.lightEnd1), lineWidth: 4))
                        .frame(width: 175, height: 125)
                        .shadow(color: Color.darkStart, radius: 5, x: -5, y: -5)
                        .shadow(color: Color.darkEnd, radius: 5, x: 5, y: 5)
                }
                
                HStack {
                    HStack {
                        VStack{
                            Text(String(self.myGame.getP2PointsLeft())).padding()
                            Text(String(self.myGame.getP2DartsLeft()))
                        }
                    }
                    VStack(alignment: .trailing){
                        HStack {
                            Text(String(self.myGame.getP2CurrentRoundScore())).frame(width: 50).border(Color.white, width: 1)
                            Text(String(self.myGame.getP2prevRoundScore())).strikethrough()
                        }
                        Text(self.myGame.getPlayer2Name()).font(.system(size: 24))
                    }.frame(maxWidth: .infinity)
                    
                }
                .font(.system(size: 12))
                .frame(width: 165, height: 110)
                .foregroundColor(Color.white)
                
            }
            
        }
        
        
        
    }
}

struct PlayerScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScoreView(id: .player1, myGame: X01Game(targetPoints: 301))
    }
}

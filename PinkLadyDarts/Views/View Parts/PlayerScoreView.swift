//
//  PlayerScoreView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 4/15/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct PlayerScoreView: View {
    
    @ObservedObject var X01GameVM: X01GameViewModel
    
    var isLHS: Bool
    
    var body: some View {
        
        ZStack {
            
            if isLHS {
                
                // handles highlight if it is player 1 turn
                if (self.X01GameVM.getPlayer1().getIsTurn())
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
                            Text("\(self.X01GameVM.getPlayer1().getPreviousRoundScore())").strikethrough()
                            Text("\(self.X01GameVM.getPlayer1().getCurrentRoundScore())").frame(width: 50).border(Color.white, width: 1)
                        }
                        Text(self.X01GameVM.getPlayer1().getName()).font(.system(size: 24))
                    }.frame(maxWidth: .infinity)
                    HStack {
                        VStack {
                            Text("\(self.X01GameVM.getPlayer1().getX01Points())").padding()
                            Text("\(self.X01GameVM.getPlayer1().getDartCount())")
                        }
                    }
                }
                .font(.system(size: 12))
                .frame(width: 165, height: 110)
                .foregroundColor(Color.white)
            }
            
            // Right side
            else {
                
                // handles highlight if it is player 2 turn
                if (self.X01GameVM.getPlayer2().getIsTurn())
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
                            Text("\(self.X01GameVM.getPlayer2().getX01Points())").padding()
                            Text("\(self.X01GameVM.getPlayer2().getDartCount())")
                        }
                    }
                    VStack(alignment: .trailing){
                        HStack {
                            Text("\(self.X01GameVM.getPlayer2().getCurrentRoundScore())").frame(width: 50).border(Color.white, width: 1)
                            Text("\(self.X01GameVM.getPlayer2().getPreviousRoundScore())").strikethrough()
                        }
                        Text(self.X01GameVM.getPlayer2().getName()).font(.system(size: 24))
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
        PlayerScoreView(X01GameVM: X01GameViewModel(startingX01Points: 301), isLHS: true)
    }
}

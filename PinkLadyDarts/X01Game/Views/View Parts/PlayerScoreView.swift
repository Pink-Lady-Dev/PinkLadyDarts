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
                if (self.X01GameVM.isPlayerTurn(playerID: 1))
                {
                    Rectangle().fill(Color.PLPink).frame(width: 175, height: 125)
                }
                else {
                    Rectangle().fill(Color.PLGrey).frame(width: 175, height: 125)
                }
                
                HStack {
                    VStack(alignment: .leading){
                        HStack {
                            Text("\(self.X01GameVM.getPlayer(playerID: 1).getPreviousRoundScore())").strikethrough()
                            Text("\(self.X01GameVM.getPlayer(playerID: 1).getCurrentRoundScore())").frame(width: 50).border(Color.white, width: 1)
                        }
                        Text(self.X01GameVM.getPlayer(playerID: 1).getName()).font(.system(size: 24))
                    }.frame(maxWidth: .infinity)
                    HStack {
                        VStack {
                            Text("\(self.X01GameVM.getPlayer(playerID: 1).getStartingPoints())").padding()
                            Text("\(self.X01GameVM.getPlayer(playerID: 1).getDartCount())")
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
                if (self.X01GameVM.isPlayerTurn(playerID: 2))
                {
                    Rectangle().fill(Color.PLPink).frame(width: 173, height: 125)
                }
                else {
                    Rectangle().fill(Color.PLGrey).frame(width: 173, height: 125)
                }
                
                HStack {
                    HStack {
                        VStack{
                            Text("\(self.X01GameVM.getPlayer(playerID: 2).getStartingPoints())").padding()
                            Text("\(self.X01GameVM.getPlayer(playerID: 2).getDartCount())")
                        }
                    }
                    VStack(alignment: .trailing){
                        HStack {
                            Text("\(self.X01GameVM.getPlayer(playerID: 2).getCurrentRoundScore())").frame(width: 50).border(Color.white, width: 1)
                            Text("\(self.X01GameVM.getPlayer(playerID: 2).getPreviousRoundScore())").strikethrough()
                        }
                        Text(self.X01GameVM.getPlayer(playerID: 2).getName()).font(.system(size: 24))
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

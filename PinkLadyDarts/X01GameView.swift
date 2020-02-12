//
//  X01GameView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct X01GameView: View {
    var player1Name: String = "Player 1"
    var player2Name: String = "Player 2"
    
    @ObservedObject var myGame = X01Game(targetPoints: 301)
    
    var body: some View {
        
        ZStack {
            
            Color(.systemPink).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                GameScoreView(myGame: self.myGame)
                ButtonGrid(myGame: self.myGame)
                
                HStack(spacing: 0) {
                    GeneralButtonView(btnText: "<--")
                    GeneralButtonView(btnText: "Next Player")
                }.frame(height: 120)
            }
        }
        
    }
}

struct X01GameView_Previews: PreviewProvider {
    static var previews: some View {
        X01GameView()
    }
}

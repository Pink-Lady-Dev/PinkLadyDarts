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
    var X01Game: Int = 301
    
    var body: some View {
        VStack(spacing: 0) {
            GameScoreView(player1Name: self.player1Name, player2Name: self.player2Name, gamePoints: self.X01Game)
            ButtonGrid()
            HStack(spacing: 0) {
                GeneralButtonView(btnText: "<--")
                GeneralButtonView(btnText: "Next Player")
            }.frame(height: 120)
        }
    }
}

struct X01GameView_Previews: PreviewProvider {
    static var previews: some View {
        X01GameView()
    }
}

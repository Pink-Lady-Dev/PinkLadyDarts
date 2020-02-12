//
//  GameScoreView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct GameScoreView: View {
    
    @ObservedObject var myGame: X01Game
    
    var body: some View {
        HStack(spacing: 0) {
            PlayerScoreView(id: .player1, myGame: self.myGame)
            PlayerScoreView(id: .player2, myGame: self.myGame)
        }.frame(height: 120)
    }
}

struct GameScoreView_Previews: PreviewProvider {
    static var previews: some View {
        GameScoreView(myGame: X01Game(targetPoints: 301))
    }
}

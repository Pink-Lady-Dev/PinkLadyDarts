//
//  GameScoreView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct GameScoreView: View {
    
    var player1Name: String
    var player2Name: String
    var gamePoints: Int
    
    var body: some View {
        HStack(spacing: 0) {
            PlayerScoreView(pointsLeft: 301, playerName: player1Name, id: .player1, turnHighlightColor: Color.red)
            PlayerScoreView(pointsLeft: 301, playerName: player2Name, id: .player2)
        }.frame(height: 120)
    }
}

struct GameScoreView_Previews: PreviewProvider {
    static var previews: some View {
        GameScoreView(player1Name: "Nick", player2Name: "Jake", gamePoints: 301)
    }
}

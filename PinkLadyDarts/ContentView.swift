//
//  ContentView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObservedObject var myGame = X01Game(targetPoints: 301)
    
    var body: some View {
//        X01GameView(player1Name: "Nick", player2Name: "Jake", myGame: self.myGame)
        //GameScoreView(myGame: self.myGame)
        GameSelectionView(myGame: self.myGame)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

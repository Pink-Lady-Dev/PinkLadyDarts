//
//  ContentView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        X01GameView(player1Name: "Nick", player2Name: "Jake")
//        GameSelectionView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

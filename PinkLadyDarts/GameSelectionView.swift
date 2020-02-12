//
//  GameSelectionView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct GameSelectionView: View {
    
    @ObservedObject var myGame: X01Game
    
    var body: some View {
        NavigationView {
            
            NavigationLink(destination: X01GameView(player1Name: "Nick", player2Name: "Jake", myGame:self.myGame)) {
                Text("X01").fontWeight(.heavy)
                
            }
            
            
        }
    }
}

//struct GameSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameSelectionView()
//    }
//}

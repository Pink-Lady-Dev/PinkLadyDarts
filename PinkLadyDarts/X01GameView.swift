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
     @State var showContentView: Bool = false
    @ObservedObject var myGame: X01Game;
//    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            if self.showContentView
            {
                ContentView()
            }
            
            VStack(spacing: 0) {
                
                GameScoreView(myGame: self.myGame)
                ButtonGrid(myGame: self.myGame)
                
                HStack(spacing: 0) {
                    BackButtonView(btnText: "<--", myGame: self.myGame)
                    NextPlayerButtonView(btnText: "Next Player", myGame: self.myGame)
                }.frame(height: 120)
            }
        }.alert(isPresented: $myGame.showingAlert, content: {
            Alert(title: Text("Game Over"),
                  message: Text(self.myGame.getP1Won() ? "P1 Won" : "P2 Won"),
                  dismissButton: .default(Text("OK"))
                  {
                    // TODO: Go back to menu after game ends
                    //self.showContentView = true
                    print("do something")
                    
                })
        })
        
        
    }
}

//struct X01GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        X01GameView()
//    }
//}

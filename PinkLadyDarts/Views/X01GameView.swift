//
//  X01GameView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct X01GameView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var myGame: X01Game;
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            LinearGradient(Color.darkStart, Color.darkEnd)
            
            VStack(alignment: .center, spacing: 0) {
                
                Button(action: {
                    self.viewRouter.currentPage = "mainMenu"
                }) {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                }
                .buttonStyle(ColorfulCircleButtonStyle())
                
                GameScoreView(myGame: self.myGame).padding(20)
                ButtonGrid(myGame: self.myGame)
                
                HStack(spacing: 4) {
                    // TODO: Make this a separate view similar to "GameScoreView.swift"
                    BackButtonView(btnText: "<--", txtWidth: 125, txtHeight: 50, myGame: self.myGame)
                    NextPlayerButtonView(btnText: "Next Player", txtWidth: 125, txtHeight: 50, myGame: self.myGame)
                    
                }
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
            // something like this should be done when the game ends in order to send the game to the website
            .alert(isPresented: $myGame.showingAlert, content: {
                Alert(title: Text("Game Over"),
                      message: Text(self.myGame.getP1Won() ? self.myGame.getPlayer1Name() + " Won" : self.myGame.getPlayer2Name() +   " Won"),
                      dismissButton: Alert.Button.default(Text("OK"), action: {
                        self.viewRouter.currentPage = "mainMenu"
                      }))
                
            })
        
        
        
    }
    
}

struct X01GameView_Previews: PreviewProvider {
    static var previews: some View {
        X01GameView(viewRouter: ViewRouter(), myGame: X01Game(targetPoints: 301))
    }
}

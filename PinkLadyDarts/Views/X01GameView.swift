//
//  X01GameView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//
// This is the View that is presented to the user
// when playing any X01 game
//

import SwiftUI

struct X01GameView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var X01GameVM: X01GameViewModel
    
    var body: some View {
        
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)
            VStack {
                X01ScoreBoardView(X01GameVM: X01GameVM)
                ButtonGrid(X01GameVM: X01GameVM)
            }
        }.edgesIgnoringSafeArea(.all)
            .alert(isPresented: $X01GameVM.showingAlert, content: {
                Alert(title: Text("Game Over"),
                      message: Text(self.X01GameVM.getPlayer1().getDidWin() ? self.X01GameVM.getPlayer1().getName() + " Won" : self.X01GameVM.getPlayer2().getName() +   " Won"),
                      dismissButton: Alert.Button.default(Text("OK"), action: {
                        self.viewRouter.currentPage = "mainMenu"
                      }))
            })
        
    }
    
}

//struct completeX01GameView: View {
//
//    @ObservedObject var X01GameVM: X01GameViewModel;
//
//    var body: some View {
//
//        VStack(alignment: .center, spacing: 0) {
//            //
//            // TODO: Add menu navigation to exit game, go back to menu, etc.
//            //
//            GameScoreView(myGame: self.myGame).padding(20)
//            ButtonGrid(myGame: self.myGame)
//
//            HStack(spacing: 4) {
//                SimpleButtonView(btnText: "<--", txtWidth: 125, txtHeight: 50, btnAction: backBtnAction, myGame: self.myGame)
//                SimpleButtonView(btnText: "Next Player", txtWidth: 125, txtHeight: 50, btnAction: nextBtnAction, myGame: self.myGame)
//            }
//        }
//    }
//
//    let backBtnAction = { print("DEBUG: Back Button Clicked") }
//    let nextBtnAction = { print("DEBUG: Next Button Clicked") }
//
//}



//struct X01GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        X01GameView(viewRouter: ViewRouter(), myGame: X01Game(targetPoints: 301))
//    }
//}

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
            VStack(spacing: 4) {
                X01ScoreBoardView(X01GameVM: X01GameVM).padding()
                ButtonGrid(X01GameVM: X01GameVM)
                HStack(spacing: 4) {
                    SimpleButtonView(btnText: "<--", txtWidth: 125, txtHeight: 50, btnAction: backBtnAction, X01GameVM: X01GameVM)
                    SimpleButtonView(btnText: "Next Player", txtWidth: 125, txtHeight: 50, btnAction: { self.nextBtnAction() }, X01GameVM: X01GameVM)
                }
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

    func nextBtnAction() {
        self.X01GameVM.objectWillChange.send()
        self.X01GameVM.nextButtonCallback()
    }
    
    func backBtnAction() {
        self.X01GameVM.objectWillChange.send()

        do {
            try self.X01GameVM.backButtonCallback()
        }
        catch {
            print(error)
        }
    }

}


struct X01GameView_Previews: PreviewProvider {
    static var previews: some View {
        X01GameView(viewRouter: ViewRouter(), X01GameVM: X01GameViewModel(startingX01Points: 301))
    }
}

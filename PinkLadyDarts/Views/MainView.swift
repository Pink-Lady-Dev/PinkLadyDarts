//
//  MainView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/25/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

//===========================================================================//
//
// This is the Main Menu for the app, it controls all the views (currently)
// and is shown on startup
//
//===========================================================================//

import SwiftUI
import Foundation
import Combine

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "mainMenu" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var X01GameScore: Int = 301 {
        didSet {
            objectWillChange.send(self)
        }
    }
}

// TODO: Clean this up with an enum or something
//       Add a "loading screen" that lets the user input the player names
//       Potentially only show this if the player is not logged in?
struct MainView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    @State var p1Name: String = "Player 1"
    @State var p2Name: String = "Player 2"
    
    var body: some View {
        VStack {
            
            if viewRouter.currentPage == "mainMenu" {
                ContentView(viewRouter: viewRouter).animation(.easeInOut)
            }
            else if viewRouter.currentPage == "X01PointSelection" {
                X01GameTypeSelectionView(viewRouter: viewRouter).animation(.easeInOut)
            }
            else if viewRouter.currentPage == "X01Game" {
//                X01GameView(viewRouter: viewRouter, myGame: X01Game(targetPoints: viewRouter.X01GameScore, p1Name: self.p1Name, p2Name: self.p2Name))
                X01GameView(viewRouter: viewRouter, myGame: X01Game(targetPoints: viewRouter.X01GameScore, p1Name: "Nick", p2Name: "Jake"))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}

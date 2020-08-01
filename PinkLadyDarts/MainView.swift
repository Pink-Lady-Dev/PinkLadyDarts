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

//
// View manager
// Allows views to be easily switched between
//
// I think that any value that needs to be passed around throughout the entire application
// can be added as an attribute to this class. This is an easy way to pass menu options from 1
// view to another.
//

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

struct MainView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            
            if viewRouter.currentPage == "mainMenu" {
                ContentView(viewRouter: viewRouter).animation(.easeInOut)
            }
            else if viewRouter.currentPage == "X01PointSelection" {
                X01GameTypeSelectionView(viewRouter: viewRouter).animation(.easeInOut)
            }
            else if viewRouter.currentPage == "X01Game" {
                X01GameView(viewRouter: viewRouter, X01GameVM: X01GameViewModel(startingX01Points: viewRouter.X01GameScore))
            }
            else if viewRouter.currentPage == "loginView" {
                LoginView(viewRouter: viewRouter).animation(.easeInOut)
            }
            else if viewRouter.currentPage == "cricketGame" {
                CricketGameView(viewRouter: viewRouter, CricketGameVM: CricketGameViewModel(startingPoints: 0)).animation(.easeInOut)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}

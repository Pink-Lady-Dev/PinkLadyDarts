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
// ###########
// # History #
// ###########
//    Date          Name            Comment
// 25-Feb-2020      Nick Clason     Initial
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
}

// TODO: Clean this up with an enum or something
//       Add a "loading screen" that lets the user input the player names
//       Potentially only show this if the player is not logged in?
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
            else if viewRouter.currentPage == "301Game" {
                X01GameView(viewRouter: viewRouter, myGame: X01Game(targetPoints: 301))
            }
            else if viewRouter.currentPage == "501Game" {
                X01GameView(viewRouter: viewRouter, myGame: X01Game(targetPoints: 501))
            }
            else if viewRouter.currentPage == "701Game" {
                X01GameView(viewRouter: viewRouter, myGame: X01Game(targetPoints: 701))
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}

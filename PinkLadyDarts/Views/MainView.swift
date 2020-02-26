//
//  MainView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/25/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "page1" {
        didSet {
            objectWillChange.send(self)
        }
    }
}

// TODO: Clean this up with an enum or something
struct MainView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "page1" {
                ContentView(viewRouter: viewRouter).animation(.easeInOut)
            }
            else if viewRouter.currentPage == "page2" {
                X01GameTypeSelectionView(viewRouter: viewRouter).animation(.easeInOut)
            }
            else if viewRouter.currentPage == "301Game" {
                X01GameView(player1Name: "Nick", player2Name: "Jake", viewRouter: viewRouter, myGame: X01Game(targetPoints: 301))
            }
            else if viewRouter.currentPage == "501Game" {
                X01GameView(player1Name: "Nick", player2Name: "Jake", viewRouter: viewRouter, myGame: X01Game(targetPoints: 501))
            }
            else if viewRouter.currentPage == "701Game" {
                X01GameView(player1Name: "Nick", player2Name: "Jake", viewRouter: viewRouter, myGame: X01Game(targetPoints: 701))
            }
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}

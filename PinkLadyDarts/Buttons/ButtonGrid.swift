//
//  ButtonGrid.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ButtonGrid: View {
    
    @ObservedObject var myGame: X01Game
    
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    ButtonView(btnText: "Miss", txtWidth: 15, txtHeight: 20, myGame: self.myGame, hasContextMenu: false)
                    ButtonView(btnText: "Bull\n(25)",txtWidth: 15, txtHeight: 100, myGame: self.myGame, hasContextMenu: false)
                    ButtonView(btnText: "Bull\n(50)",txtWidth: 15, txtHeight: 100, myGame: self.myGame, hasContextMenu: false)
                }
                VStack(spacing: 0) {
                    ButtonView(btnText: "20",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "16",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "12",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "8",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "4",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                }
                VStack(spacing: 0) {
                    ButtonView(btnText: "19",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "15",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "11",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "7",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "3",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                }
                VStack(spacing: 0) {
                    ButtonView(btnText: "18",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "14",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "10",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "6",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "2",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                }
                VStack(spacing: 0) {
                    ButtonView(btnText: "17",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "13",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "9",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "5",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                    ButtonView(btnText: "1",txtWidth: 15, txtHeight: 20, myGame: self.myGame)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ButtonGrid_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGrid(myGame: X01Game(targetPoints: 301))
    }
}

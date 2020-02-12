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
        

        HStack(spacing: 0) {
            VStack(spacing: 0) {
                ButtonView(btnText: "Miss", myGame: self.myGame, hasContextMenu: false).frame(height: 80)
                ButtonView(btnText: "Bull\n(25)", myGame: self.myGame, hasContextMenu: false)
                ButtonView(btnText: "Bull\n(50)", myGame: self.myGame, hasContextMenu: false)
            }
            VStack(spacing: 0) {
                ButtonView(btnText: "20", myGame: self.myGame)
                ButtonView(btnText: "16", myGame: self.myGame)
                ButtonView(btnText: "12", myGame: self.myGame)
                ButtonView(btnText: "8", myGame: self.myGame)
                ButtonView(btnText: "4", myGame: self.myGame)
            }
            VStack(spacing: 0) {
                ButtonView(btnText: "19", myGame: self.myGame)
                ButtonView(btnText: "15", myGame: self.myGame)
                ButtonView(btnText: "11", myGame: self.myGame)
                ButtonView(btnText: "7", myGame: self.myGame)
                ButtonView(btnText: "3", myGame: self.myGame)
            }
            VStack(spacing: 0) {
                ButtonView(btnText: "18", myGame: self.myGame)
                ButtonView(btnText: "14", myGame: self.myGame)
                ButtonView(btnText: "10", myGame: self.myGame)
                ButtonView(btnText: "6", myGame: self.myGame)
                ButtonView(btnText: "2", myGame: self.myGame)
            }
            VStack(spacing: 0) {
                ButtonView(btnText: "17", myGame: self.myGame)
                ButtonView(btnText: "13", myGame: self.myGame)
                ButtonView(btnText: "9", myGame: self.myGame)
                ButtonView(btnText: "5", myGame: self.myGame)
                ButtonView(btnText: "1", myGame: self.myGame)
            }
            
        }.frame(height: 400)
        
    }
}

    struct ButtonGrid_Previews: PreviewProvider {
        static var previews: some View {
            ButtonGrid(myGame: X01Game(targetPoints: 301))
        }
}

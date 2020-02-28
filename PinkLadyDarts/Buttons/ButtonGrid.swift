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
        
        /*
         ZStack {
         
         LinearGradient(Color.darkStart, Color.darkEnd)
         
         HStack(spacing: 0) {
         VStack(spacing: 0) {
         Button(action: {
         print("0")
         }) {
         Text("Miss")
         .fixedSize()
         .frame(width: 20, height: 20)
         .multilineTextAlignment(.center)
         .foregroundColor(.white)
         
         }
         
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("25")
         }) {
         Text("Bull\n(25)")
         .fixedSize()
         .frame(width: 20, height: 100)
         .multilineTextAlignment(.center)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("50")
         }) {
         Text("Bull\n(50)")
         .fixedSize()
         .frame(width: 20, height: 100)
         .multilineTextAlignment(.center)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         }
         VStack(spacing: 0) {
         Button(action: {
         print("20")
         }) {
         Text("20")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("16")
         }) {
         Text("16")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("12")
         }) {
         Text("12")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("8")
         }) {
         Text("8")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("4")
         }) {
         Text("4")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         }
         VStack(spacing: 0) {
         Button(action: {
         print("19")
         }) {
         Text("19")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("15")
         }) {
         Text("15")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("11")
         }) {
         Text("11")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("7")
         }) {
         Text("7")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("3")
         }) {
         Text("3")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         }
         VStack(spacing: 0) {
         Button(action: {
         print("18")
         }) {
         Text("18")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("14")
         }) {
         Text("14")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("10")
         }) {
         Text("10")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("6")
         }) {
         Text("6")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("2")
         }) {
         Text("2")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         }
         VStack(spacing: 0) {
         Button(action: {
         print("17")
         }) {
         Text("17")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("13")
         }) {
         Text("13")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("9")
         }) {
         Text("9")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("5")
         }) {
         Text("5")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         Button(action: {
         print("1")
         }) {
         Text("1")
         .fixedSize()
         .frame(width: 20, height: 20)
         .foregroundColor(.white)
         }
         .buttonStyle(ColorfulRectangleButtonStyle())
         }
         
         }.frame(width: 300)
         
         }
         .edgesIgnoringSafeArea(.all)
         */
        
        
    }
}

struct ButtonGrid_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGrid(myGame: X01Game(targetPoints: 301))
    }
}

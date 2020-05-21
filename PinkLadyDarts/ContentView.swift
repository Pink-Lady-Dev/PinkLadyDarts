//
//  ContentView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

//
// This view serves as the main menu. Currently
// there is only the option to play X01 mode.
//
// TODO: Add more games
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    
    static let lightStart1 = Color(red: 240 / 255, green: 80 / 255, blue: 120 / 255)
    static let lightEnd1 = Color(red: 120 / 255, green: 40 / 255, blue: 60 / 255)
    
    static let btnColor = Color(red: 255 / 255, green: 216 / 255, blue: 166 / 255)
    static let altBtnColor = Color(red: 252 / 255, green: 130 / 255, blue: 16 / 255)
    
    static let btnTextColor = Color(red: 80 / 255, green: 72 / 255, blue: 65 / 255)
    
    static let overlayBorder = Color(red: 110 / 255, green: 102 / 255, blue: 94 / 255)
    
    static let playerHighlight = Color(red: 247 / 255, green: 106 / 255, blue: 140 / 255)
    static let notPlayerTurn = Color(red: 69 / 255, green: 69 / 255, blue: 77 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct ColorfulCircleBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.lightEnd1, Color.lightStart1))
                    .overlay(shape.stroke(LinearGradient(Color.lightStart1, Color.lightEnd1), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(LinearGradient(Color.lightStart1, Color.lightEnd1), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}
struct ColorfulCircleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                ColorfulCircleBackground(isHighlighted: configuration.isPressed, shape: Circle())
        )
            .animation(nil)
    }
}


struct ColorfulRectangleBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.red)
                    .overlay(shape.stroke(Color.overlayBorder))
            } else {
                shape
                    .fill(Color.btnColor)
                    .overlay(shape.stroke(Color.overlayBorder))
            }
        }
    }
}
struct ColorfulRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Rectangle())
            .background(
                ColorfulRectangleBackground(isHighlighted: configuration.isPressed, shape: Rectangle())
        )
            .animation(nil)
    }
}



struct X01TypeBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.playerHighlight)
                    .overlay(shape.stroke(LinearGradient(Color.lightStart1, Color.lightEnd1), lineWidth: 4))
                
            } else {
                shape
                    .fill(Color.notPlayerTurn)
                    .overlay(shape.stroke(Color.playerHighlight, lineWidth: 4))
                
            }
        }
    }
}
struct X01TypeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                X01TypeBackground(isHighlighted: configuration.isPressed, shape: Circle())
                
        )
            .animation(nil)
    }
}
struct X01MenuRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Rectangle())
            .background(
                X01TypeBackground(isHighlighted: configuration.isPressed, shape: Rectangle())
        )
            .animation(nil)
    }
}



struct AltBtnBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.red)
                    .overlay(shape.stroke(Color.overlayBorder))
            } else {
                shape
                    .fill(Color.altBtnColor)
                    .overlay(shape.stroke(Color.overlayBorder))
            }
        }
    }
}
struct AltRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Rectangle())
            .background(
                AltBtnBackground(isHighlighted: configuration.isPressed, shape: Rectangle())
        )
            .animation(nil)
    }
}




struct ContentView : View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack {
            Color.notPlayerTurn
            VStack(spacing: 30) {
                Button(action: {
                    self.viewRouter.currentPage = "X01PointSelection"
                }) {
                    Text("X01 Games")
                        .font(.system(size: 24)).bold()
                        .foregroundColor(.white).frame(width:180, height: 50)
                }
                .buttonStyle(X01MenuRectangleButtonStyle())
                
                Button(action: {
                    //                    self.viewRouter.currentPage = "X01PointSelection"
                    print("TODO: Cricket")
                }) {
                    Text("Cricket Games")
                        .font(.system(size: 24)).bold()
                        .foregroundColor(.white).frame(width:180, height: 50)
                }
                .buttonStyle(X01MenuRectangleButtonStyle())
                
                Button(action: {
                    //                    self.viewRouter.currentPage = "X01PointSelection"
                    print("TODO: Login")
                }) {
                    Text("Log In")
                        .font(.system(size: 24)).bold()
                        .foregroundColor(.white).frame(width:180, height: 50)
                }
                .buttonStyle(X01MenuRectangleButtonStyle())
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

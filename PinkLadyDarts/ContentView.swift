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

// Custom Color Pallete
extension Color {
    
    // Gradient Colors
    static let PLPinkGradientStart = Color(red: 240 / 255, green: 80 / 255, blue: 120 / 255)
    static let PLPinkGradientEnd = Color(red: 120 / 255, green: 40 / 255, blue: 60 / 255)
    static let PLDarkGradientStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let PLDarkGradientEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    // Text Colors
    static let PLTextGrey = Color(red: 80 / 255, green: 72 / 255, blue: 65 / 255)
    static let PLTextField = Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    
    // Standard Colors
    static let PLOrange = Color(red: 255 / 255, green: 216 / 255, blue: 166 / 255)
    static let PLLightOrange = Color(red: 252 / 255, green: 130 / 255, blue: 16 / 255)
    static let PLPink = Color(red: 247 / 255, green: 106 / 255, blue: 140 / 255)
    static let PLGrey = Color(red: 69 / 255, green: 69 / 255, blue: 77 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}


struct PLRectangleBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.PLPink)
                    .overlay(shape.stroke(Color.PLGrey))
            } else {
                shape
                    .fill(Color.PLOrange)
                    .overlay(shape.stroke(Color.PLGrey))
            }
        }
    }
}
struct PLRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Rectangle())
            .background(
                PLRectangleBackground(isHighlighted: configuration.isPressed, shape: Rectangle())
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
                    .fill(Color.PLPink)
                    .overlay(shape.stroke(LinearGradient(Color.PLPinkGradientStart, Color.PLPinkGradientEnd), lineWidth: 4))
                
            } else {
                shape
                    .fill(Color.PLGrey)
                    .overlay(shape.stroke(Color.PLPink, lineWidth: 4))
                
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
                    .fill(Color.PLPink)
                    .overlay(shape.stroke(Color.PLGrey))
            } else {
                shape
                    .fill(Color.PLLightOrange)
                    .overlay(shape.stroke(Color.PLGrey))
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
            Color.PLGrey
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
                    self.viewRouter.currentPage = "cricketGame"
                }) {
                    Text("Cricket Games")
                        .font(.system(size: 24)).bold()
                        .foregroundColor(.white).frame(width:180, height: 50)
                }
                .buttonStyle(X01MenuRectangleButtonStyle())
                
                Button(action: {
                    self.viewRouter.currentPage = "loginView"
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

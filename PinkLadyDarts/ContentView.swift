//
//  ContentView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var showX01GameSelectionView: Bool = false
    
    //@ObservedObject var myGame = X01Game(targetPoints: 301)
    
    var body: some View {
        //        X01GameView(player1Name: "Nick", player2Name: "Jake", myGame: self.myGame)
        //        GameScoreView(myGame: self.myGame)
        //        GameSelectionView(myGame: self.myGame)
        ZStack {
//            Color(.blue).edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack{
                if showX01GameSelectionView {
                    X01GameTypeSelectionView()
                }
                else{
                    
                    Button(action: {
                        print("X01 Selected")
                        self.showX01GameSelectionView = true
                    }) {
                        HStack {
                            Text("X01")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    }
                }
                
                
                
                
            }}
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

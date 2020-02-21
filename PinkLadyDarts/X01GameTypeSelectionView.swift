//
//  X01GameTypeSelectionView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/20/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct X01GameTypeSelectionView: View {
    @State var showView = false
    @State var show301GameSelectionView: Bool = false
    @State var show501GameSelectionView: Bool = false
    @State var show701GameSelectionView: Bool = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack(spacing: 50) {
                    // Select 301
                    Button(action: {
                        print("301 Selected")
                        self.show301GameSelectionView = true
                    }) {
                        HStack {
                            Text("301")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    }
                    
                    // Select 501
                    Button(action: {
                        print("501 Selected")
                        self.show501GameSelectionView = true
                    }) {
                        HStack {
                            Text("501")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    }
                    
                    // Select 701
                    Button(action: {
                        print("701 Selected")
                        self.show701GameSelectionView = true
                    }) {
                        HStack {
                            Text("701")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    }
                }
                
                if show301GameSelectionView
                {
                    X01GameView(player1Name: "Nick", player2Name: "Jake", myGame: X01Game(targetPoints: 301))
                }
                else if show501GameSelectionView
                {
                    X01GameView(player1Name: "Nick", player2Name: "Jake", myGame: X01Game(targetPoints: 501))
                }
                else if show701GameSelectionView
                {
                    X01GameView(player1Name: "Nick", player2Name: "Jake", myGame: X01Game(targetPoints: 701))
                }
                
            }
        }
        
    }
}



//struct X01GameTypeSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        X01GameTypeSelectionView()
//    }
//}

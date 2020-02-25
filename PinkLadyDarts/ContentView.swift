//
//  ContentView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

class AppViewState: ObservableObject {
    enum ViewName {
        case contentView
        case X01SelectionView
        case X01GameView
    }

    @Published var currentView: ViewName = .contentView
    
}




struct ContentView : View {
    
    @State var showX01GameSelectionView: Bool = false
        
    var body: some View {
        
        ZStack {

            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                
                if showX01GameSelectionView {
                    X01GameTypeSelectionView()
                }


                else {
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
                
            }}.animation(.easeInOut)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

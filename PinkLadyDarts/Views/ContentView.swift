//
//  ContentView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                
                
                
                Button(action: {self.viewRouter.currentPage = "page2"})
                {
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
                
                
            }}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

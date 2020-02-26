//
//  X01GameTypeSelectionView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/20/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct X01GameTypeSelectionView: View {
    
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)

            VStack(spacing: 50) {
                
                // Select 301
                Button(action: { self.viewRouter.currentPage = "301Game" } ) {
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
                Button(action: { self.viewRouter.currentPage = "501Game" } ) {
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
                Button(action: { self.viewRouter.currentPage = "701Game" } ) {
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
                
                Button(action: { self.viewRouter.currentPage = "mainMenu" } ) {
                    HStack {
                        Text("Main Menu")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                }
                
            }
        }
        
    }

}



struct X01GameTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        X01GameTypeSelectionView(viewRouter: ViewRouter())
    }
}

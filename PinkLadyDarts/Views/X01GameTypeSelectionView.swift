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
        
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)
            
            VStack(spacing: 40) {
                Button(action: {
                    self.viewRouter.currentPage = "301Game"
                }) {
                    Text("301")
                        .foregroundColor(.white)
                }
                .buttonStyle(ColorfulButtonStyle())
                
                Button(action: {
                    self.viewRouter.currentPage = "501Game"
                }) {
                    Text("501")
                        .foregroundColor(.white)
                }
                .buttonStyle(ColorfulButtonStyle())
                
                Button(action: {
                    self.viewRouter.currentPage = "701Game"
                }) {
                    Text("701")
                        .foregroundColor(.white)
                }
                .buttonStyle(ColorfulButtonStyle())
                
                Button(action: {
                    self.viewRouter.currentPage = "mainMenu"
                }) {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                }
                .buttonStyle(ColorfulButtonStyle())
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}



struct X01GameTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        X01GameTypeSelectionView(viewRouter: ViewRouter())
    }
}

//
//  ButtonGrid.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ButtonGrid: View {
    
    @ObservedObject var X01GameVM: X01GameViewModel
    
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "Miss", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "Bull\n(25)", txtWidth: 15, txtHeight: 100)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "Bull\n(50)", txtWidth: 15, txtHeight: 100)
                }
                VStack(spacing: 0) {
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "20", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "16", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "12", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "8", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "4", txtWidth: 15, txtHeight: 20)
                }
                VStack(spacing: 0) {
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "19", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "15", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "11", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "7", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "3", txtWidth: 15, txtHeight: 20)
                }
                VStack(spacing: 0) {
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "18", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "14", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "10", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "6", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "2", txtWidth: 15, txtHeight: 20)
                }
                VStack(spacing: 0) {
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "17", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "13", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "9", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "5", txtWidth: 15, txtHeight: 20)
                    ButtonView(X01GameVM: self.X01GameVM, btnText: "1", txtWidth: 15, txtHeight: 20)
                }
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
}


struct ButtonGrid_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGrid(X01GameVM: X01GameViewModel(startingX01Points: 301))
    }
}

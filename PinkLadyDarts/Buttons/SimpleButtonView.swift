//
//  SimpleButtonView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 3/9/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct SimpleButtonView: View {
    var btnText: String
    var txtWidth: CGFloat
    var txtHeight: CGFloat
    var btnAction: ()->()
    let generator = UIImpactFeedbackGenerator(style: .medium)
    
    @ObservedObject var myGame: X01GameViewModel
    
    
    var body: some View {
        
        Button(action: {
            self.btnTap()
        }) {
            Text(btnText)
                .fixedSize()
                .frame(width: txtWidth, height: txtHeight)
                .foregroundColor(.white)
        }
        .buttonStyle(ColorfulRectangleButtonStyle())
        
    }
    
    func btnTap()
    {
        self.generator.impactOccurred()
        btnAction()
    }
}

//struct SimpleButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleButtonView(btnText: "Test", txtWidth: 100, txtHeight: 50, btnAction: {print("Test Button")}, myGame: X01Game(targetPoints: 301))
//    }
//}

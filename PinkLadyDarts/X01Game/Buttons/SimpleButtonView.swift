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
    var btnType: Int
    var txtWidth: CGFloat
    var txtHeight: CGFloat
    var btnAction: ()->()
    let generator = UIImpactFeedbackGenerator(style: .medium)
    
    @ObservedObject var X01GameVM: X01GameViewModel
    
    
    var body: some View {
        
        if btnType == 1 {
            return AnyView(Button(action: {
                self.btnTap()
            }) {
                Text(btnText)
                    .fixedSize()
                    .frame(width: txtWidth, height: txtHeight)
                    .foregroundColor(.black)
            }
            .buttonStyle(PLRectangleButtonStyle()))
        }
        else {
            return AnyView(Button(action: {
                self.btnTap()
            }) {
                Text(btnText)
                    .fixedSize()
                    .frame(width: txtWidth, height: txtHeight)
                    .foregroundColor(.black)
            }
            .buttonStyle(AltRectangleButtonStyle()))
        }
        
        
        
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

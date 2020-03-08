//
//  NextPlayerButtonView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/12/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct NextPlayerButtonView: View {
    var btnText: String // text displayed in button
    var txtWidth: CGFloat
    var txtHeight: CGFloat
    
    let generator = UIImpactFeedbackGenerator(style: .medium) // haptic feedback on regular tap
    
    @ObservedObject var myGame: X01Game
    
    
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
        self.myGame.nextTurn()
        
    }
}



//struct NextPlayerButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        NextPlayerButtonView(btnText: "Next Player", myGame: X01Game(targetPoints: 301))
//    }
//}

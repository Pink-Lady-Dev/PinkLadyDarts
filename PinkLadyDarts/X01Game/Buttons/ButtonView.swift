//
//  ButtonView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    @ObservedObject var X01GameVM: X01GameViewModel
    let generator = UIImpactFeedbackGenerator(style: .medium)
    
    var btnTextObj: AnyView
    var btnType: Int
    var btnVal: Int
    var hasContextMenu: Bool = true
    
    var body: some View {
        if btnType == 1 {
            return AnyView(Button(action: { self.buttonCallback(multiplier: 1) } ) { btnTextObj }
                .buttonStyle(AltRectangleButtonStyle())
                .contextMenu(self.hasContextMenu ?
                    ContextMenu {
                        Button( action: { self.buttonCallback(multiplier: 1) } ) {
                            Text("Single")
                        }
                        
                        Button( action: { self.buttonCallback(multiplier: 2) } ) {
                            Text("Double")
                        }
                        
                        Button( action: { self.buttonCallback(multiplier: 3) } ) {
                            Text("Triple")
                        }
                    } : nil))
        }
        else {
            return AnyView(Button(action: { self.buttonCallback(multiplier: 1) } ) { btnTextObj }
                .buttonStyle(PLRectangleButtonStyle())
                .contextMenu(self.hasContextMenu ?
                    ContextMenu {
                        Button( action: { self.buttonCallback(multiplier: 1) } ) {
                            Text("Single")
                        }
                        
                        Button( action: { self.buttonCallback(multiplier: 2) } ) {
                            Text("Double")
                        }
                        
                        Button( action: { self.buttonCallback(multiplier: 3) } ) {
                            Text("Triple")
                        }
                    } : nil))
        }
        
    }
    
    // Number Button action
    func buttonCallback(multiplier: Int) {
        
        self.X01GameVM.objectWillChange.send()
        self.generator.impactOccurred()
        
        var player: Player
        
        if (self.X01GameVM.getPlayer1().getIsTurn()) {
            player = self.X01GameVM.getPlayer1()
        }
        else {
            player = self.X01GameVM.getPlayer2()
        }
        
        
        if (self.btnVal == 25) {
            self.X01GameVM.numberButtonCallback(player: player, value: 25)
        }
        else if (self.btnVal == 50) {
            self.X01GameVM.numberButtonCallback(player: player, value: 50)
        }
        else {
            let adjustedVal = self.btnVal * multiplier
            self.X01GameVM.numberButtonCallback(player: player, value: adjustedVal)
        }
    }
    
}


//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView(X01GameVM: X01GameViewModel(startingX01Points: 301), btnText: "Click Me", txtWidth: 20, txtHeight: 20)
//    }
//}

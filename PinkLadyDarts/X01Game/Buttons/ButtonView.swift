//
//  ButtonView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    
    @ObservedObject var GameVM: GameViewModel
    let generator = UIImpactFeedbackGenerator(style: .medium)
    
    var btnTextObj: AnyView
    var btnType: Int
    var btnVal: Int
    var hasContextMenu: Bool = true
    
    var body: some View {
        if btnType == 1 {
            return AnyView(Button(action: { self.btnCallback(multiplier: 1) } ) { btnTextObj }
                .buttonStyle(AltRectangleButtonStyle())
                .contextMenu(self.hasContextMenu ?
                    ContextMenu {
                        Button( action: { self.btnCallback(multiplier: 1) } ) {
                            Text("Single")
                        }
                        
                        Button( action: { self.btnCallback(multiplier: 2) } ) {
                            Text("Double")
                        }
                        
                        Button( action: {  self.btnCallback(multiplier: 3) } ) {
                            Text("Triple")
                        }
                    } : nil))
        }
        else {
            return AnyView(Button(action: {  self.btnCallback(multiplier: 1) } ) { btnTextObj }
                .buttonStyle(PLRectangleButtonStyle())
                .contextMenu(self.hasContextMenu ?
                    ContextMenu {
                        Button( action: {  self.btnCallback(multiplier: 1) } ) {
                            Text("Single")
                        }
                        
                        Button( action: {  self.btnCallback(multiplier: 2) } ) {
                            Text("Double")
                        }
                        
                        Button( action: {  self.btnCallback(multiplier: 3) } ) {
                            Text("Triple")
                        }
                    } : nil))
        }
        
    }

    
    func btnCallback(multiplier: Int) {
        
        self.GameVM.objectWillChange.send()
        self.GameVM.buttonCallback(btnVal: self.btnVal, multiplier: multiplier)
        
    }
}


//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView(X01GameVM: X01GameViewModel(startingX01Points: 301), btnText: "Click Me", txtWidth: 20, txtHeight: 20)
//    }
//}

//
//  ButtonView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

//struct ButtonView: View {
//
//    @State private var doublePointVal: Int = 0
//    @State private var triplePointVal: Int = 0
//    @State private var pointVal: Int = 0
//
//
//    var btnText: String // text displayed in button
//    var txtWidth: CGFloat
//    var txtHeight: CGFloat
//
//    @ObservedObject var myGame: X01Game // Game Object
//
//    var hasContextMenu: Bool = true // true for buttons that have multipliers
//    let generator = UIImpactFeedbackGenerator(style: .medium) // haptic feedback on regular tap
//
//    var body: some View {
//
//        Button(action: {
//            self.btnTap()
//        }) {
//            Text(btnText)
//                .fixedSize()
//                .frame(width: txtWidth, height: txtHeight)
//                .foregroundColor(.white)
//        }
//        .buttonStyle(ColorfulRectangleButtonStyle())
//        .onAppear{
//            self.calculatePointValues()
//            self.buttonVM.setPointVals(val: self.pointVal) }
//        .contextMenu(self.hasContextMenu ?
//        ContextMenu {
//            Button(action:
//                {
//                    // Long Press tap -> Single
////                    self.myGame.dartThrow(val: self.pointVal)
//            }
//                )
//            {
//                Text("Single")
//            }
//
//            Button(action:
//                {
//                    // Long Press tap -> Double
////                    self.myGame.dartThrow(val: self.doublePointVal)
//            }
//                )
//            {
//                Text("Double")
//            }
//
//            Button(action:
//                {
//                    // Long Press tap -> Triple
////                    self.myGame.dartThrow(val: self.triplePointVal)
//            }
//                )
//            {
//                Text("Triple")
//            }
//        } : nil)
//
//    }
//
//    func btnTap()
//    {
//        // Regular tap:
//        self.generator.impactOccurred() // make phone go bzzzzz
//
//        // some basic logic shit (not even)
//        // gonna need to make this situational (i.e. which players turn it is)
//        self.myGame.dartThrow(val: self.pointVal)
//
//    }
//
//    func getDoublePoints()
//    {
//        doublePointVal = pointVal * 2
//    }
//
//    func getTriplePoints()
//    {
//        triplePointVal = pointVal * 3
//    }
//
//    func calculatePointValues()
//    {
//        if (btnText == "Bull\n(25)")
//        {
//            pointVal = 25
//        }
//        else if (btnText == "Bull\n(50)")
//        {
//            pointVal = 50
//        }
//        else
//        {
//            pointVal = Int(btnText) ?? 0
//            getDoublePoints()
//            getTriplePoints()
//        }
//
//
//    }
//
//
//
//}
//

struct ButtonView: View {
    
    @ObservedObject var X01GameVM: X01GameViewModel
    let generator = UIImpactFeedbackGenerator(style: .medium)
    
    var btnText: String
    var txtWidth: CGFloat
    var txtHeight: CGFloat
    var hasContextMenu: Bool = true
    
    var body: some View {
        Button(action: { self.buttonCallback() } ) {
            Text(btnText)
                .fixedSize()
                .frame(width: txtWidth, height: txtHeight)
                .foregroundColor(.white)
        }
        .buttonStyle(ColorfulRectangleButtonStyle())
        .contextMenu(self.hasContextMenu ?
                ContextMenu {
                    Button( action: { self.buttonCallback() } ) {
                        Text("Single")
                    }
        
                    Button( action: { self.buttonCallback() } ) {
                        Text("Double")
                    }
        
                    Button( action: { self.buttonCallback() } ) {
                        Text("Triple")
                    }
                } : nil)
    }
    
    // Number Button action
    func buttonCallback() {
        
        self.X01GameVM.objectWillChange.send()
        self.generator.impactOccurred()
        
        var player: Player
        
        if (self.X01GameVM.getPlayer1().getIsTurn()) {
            player = self.X01GameVM.getPlayer1()
        }
        else {
            player = self.X01GameVM.getPlayer2()
        }
        
        
        if (self.btnText == "Bull\n(25)") {
            self.X01GameVM.numberButtonCallback(player: player, value: 25)
        }
        else if (self.btnText == "Bull\n(50)") {
            self.X01GameVM.numberButtonCallback(player: player, value: 50)
        }
        else {
            let val = Int(self.btnText) ?? 0
            self.X01GameVM.numberButtonCallback(player: player, value: val)
        }
    }

}


//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView(btnText: "Click Me", txtWidth: 20, txtHeight: 20, myGame: X01Game(targetPoints: 301))
//    }
//}

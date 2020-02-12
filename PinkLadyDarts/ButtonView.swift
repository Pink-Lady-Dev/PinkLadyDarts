//
//  ButtonView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI


class ButtonViewModel: ObservableObject {
    
    @Published var pointVal: Int?
    @Published var doublePointVal: Int?
    @Published var triplePointVal: Int?
    
    func setPointVals(val: Int) {
        self.pointVal = val
        self.doublePointVal = val * 2
        self.triplePointVal = val * 3
    }
    
    func getSingle() -> Int {
        return self.pointVal!
    }
    
    func getDouble() -> Int {
        return self.doublePointVal!
    }
    
    func getTriple() -> Int {
        return self.triplePointVal!
    }
    
}

struct ButtonView: View {
    
    @State private var doublePointVal: Int = 0
    @State private var triplePointVal: Int = 0
    @State private var pointVal: Int = 0
    
    @ObservedObject var buttonVM = ButtonViewModel()

    var btnText: String // text displayed in button
    
    @ObservedObject var myGame: X01Game // Game Object
    
    var hasContextMenu: Bool = true // true for buttons that have multipliers
    let generator = UIImpactFeedbackGenerator(style: .medium) // haptic feedback on regular tap
    
    var body: some View {
        
        ZStack {
            Rectangle().fill(Color(.darkGray)) // button background color
            Text(btnText).multilineTextAlignment(.center) // text written to button
        }
        .onAppear {
            self.calculatePointValues()
            self.buttonVM.setPointVals(val: self.pointVal) }
            .onTapGesture()
                {
                    // Regular tap:
                    //
                    // TODO:This is where the logic for what to do after a button is pressed normally (i.e. single points)
                    
                    self.generator.impactOccurred() // make phone go bzzzzz
                    
                    // some basic logic shit (not even)
                    // gonna need to make this situational (i.e. which players turn it is)
                    self.myGame.dartThrow(val: self.pointVal)
                    
                    
        }
            .border(Color.black, width: 1) // border color
            .foregroundColor(.black) // text color
            .clipped()
            .contextMenu(self.hasContextMenu ?
                ContextMenu {
                    Button(action:
                        {
                            // Long Press tap -> Double
                            //
                            // TODO:This is where the logic for what to do after the double points option is selected
                            
                            self.myGame.dartThrow(val: self.doublePointVal)
                    }
                        )
                    {
                        Text("Double")
                    }
                    
                    Button(action:
                        {
                            // Long Press tap -> Triple
                            //
                            // TODO:This is where the logic for what to do after the triple points option is selected
                            
                            self.myGame.dartThrow(val: self.triplePointVal)
                    }
                        )
                    {
                        Text("Triple")
                    }
                } : nil)
        
    }
    
    func getDoublePoints()
    {
        doublePointVal = pointVal * 2
    }
    
    func getTriplePoints()
    {
        triplePointVal = pointVal * 3
    }
    
    
    
    func calculatePointValues()
    {
        if (btnText == "Bull\n(25)")
        {
            pointVal = 25
        }
        else if (btnText == "Bull\n(50)")
        {
            pointVal = 50
        }
        else
        {
            pointVal = Int(btnText) ?? 0
            getDoublePoints()
            getTriplePoints()
        }
        
        
    }
    

    
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(btnText: "Click Me", myGame: X01Game(targetPoints: 301))
    }
}

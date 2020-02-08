//
//  CustomButton.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    
    var btnText: String
    
    @State private var doublePointVal: Int = 0
    @State private var triplePointVal: Int = 0
    @State private var pointVal: Int = 0
    
    let generator = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(Color.red)
                .border(Color.black, width: 1)
            
            Text(btnText).multilineTextAlignment(.center)
            
        }
        .onTapGesture()
            {
                // Regular tap:
                //
                // TODO:This is where the logic for what to do after a button is pressed normally (i.e. single points)
                self.generator.impactOccurred()
                print(self.pointVal)
        }
        .clipped()
        .contextMenu()
            {
                
                Button(action:
                    {
                        // Long Press tap -> Double
                        //
                        // TODO:This is where the logic for what to do after the double points option is selected
                        
                        print(self.doublePointVal)
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
                        
                        print(self.triplePointVal)
                }
                    )
                {
                    Text("Triple")
                }
                
        }.onAppear { self.calculatePointValues() }
    }
    

    // Getter for btnText
    func getBtnText()->String
    {
        return btnText
    }
    
    // converts point strings from button Text() to Integer
    func calculatePointValues()
    {
        if (btnText == "Bull\n25")
        {
            pointVal = 25
        }
        else if (btnText == "Bull\n50")
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
    
    func getDoublePoints()
    {
        doublePointVal = pointVal * 2
    }
    
    func getTriplePoints()
    {
        triplePointVal = pointVal * 3
    }
}


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(btnText: "1")
        
    }
}

//
//  GeneralButtonView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct GeneralButtonView: View {
    var btnText: String // text displayed in button
    let generator = UIImpactFeedbackGenerator(style: .medium) // haptic feedback on regular tap
    
    var body: some View {
        
        ZStack {
            Rectangle().fill(Color.gray) // button background color
            Text(btnText).multilineTextAlignment(.center) // text written to button
        }
        .onTapGesture()
            {
                // Regular tap:
                //
                // TODO:This is where the logic for what to do after a button is pressed normally (i.e. single points)
                
                
                self.generator.impactOccurred() // make phone go bzzzzz

                
                
        }
            .border(Color.black, width: 1) // border color
            .foregroundColor(.black) // text color
            .clipped()

    }
}

struct GeneralButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralButtonView(btnText: "Click Me")
    }
}

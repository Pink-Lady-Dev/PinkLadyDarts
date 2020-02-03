//
//  CustomTextButton.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct CustomTextButton: View {
    var btnText: String
    var actionText: Int
    
    var body: some View {
        
        Button(action: {
            print(self.actionText)
            
        }, label: {
            Text(btnText).frame(width: 60, height: 45).fixedSize()
        })
            .foregroundColor(Color.white)
            .padding()
            .background(Color.gray)
//            .border(Color.pink, width: 2)

        
    }
}



//
//  ButtonGrid.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ButtonGrid: View {
    var body: some View {
        HStack(spacing: 0) {
            
            VStack(spacing: 0) {
                ButtonView(btnText: "Miss", hasContextMenu: false)
                ButtonView(btnText: "Bull\n25", hasContextMenu: false)
                ButtonView(btnText: "Bull\n50", hasContextMenu: false)
            }
            VStack(spacing: 0) {
                ButtonView(btnText: "20")
                ButtonView(btnText: "16")
                ButtonView(btnText: "12")
                ButtonView(btnText: "8")
                ButtonView(btnText: "4")
            }
            VStack(spacing: 0) {
                ButtonView(btnText: "19")
                ButtonView(btnText: "15")
                ButtonView(btnText: "11")
                ButtonView(btnText: "7")
                ButtonView(btnText: "3")
            }
            VStack(spacing: 0) {
                ButtonView(btnText: "18")
                ButtonView(btnText: "14")
                ButtonView(btnText: "10")
                ButtonView(btnText: "6")
                ButtonView(btnText: "2")
            }
            VStack(spacing: 0) {
                ButtonView(btnText: "17")
                ButtonView(btnText: "13")
                ButtonView(btnText: "9")
                ButtonView(btnText: "5")
                ButtonView(btnText: "1")
            }
            
        }.frame(height: 400)
    }
}

struct ButtonGrid_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGrid()
    }
}

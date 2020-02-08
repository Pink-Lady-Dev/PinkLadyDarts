//
//  ContentView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/2/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        GridView()
    }
}


struct GridView : View {
    var body: some View {

        HStack(spacing: 0){
            
            VStack(spacing: 0){
                CustomButton(btnText: "Miss")
                CustomButton(btnText: "Bull\n25")
                CustomButton(btnText: "Bull\n50")
            }
            VStack(spacing: 0){
                CustomButton(btnText: "20")
                CustomButton(btnText: "16")
                CustomButton(btnText: "12")
                CustomButton(btnText: "8")
                CustomButton(btnText: "4")
            }
            VStack(spacing: 0){
                CustomButton(btnText: "19")
                CustomButton(btnText: "15")
                CustomButton(btnText: "11")
                CustomButton(btnText: "7")
                CustomButton(btnText: "3")
            }
            VStack(spacing: 0){
                CustomButton(btnText: "18")
                CustomButton(btnText: "14")
                CustomButton(btnText: "10")
                CustomButton(btnText: "6")
                CustomButton(btnText: "2")
            }
            VStack(spacing: 0){
                CustomButton(btnText: "17")
                CustomButton(btnText: "13")
                CustomButton(btnText: "9")
                CustomButton(btnText: "5")
                CustomButton(btnText: "1")
            }
            
        }.frame(height: 400)

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

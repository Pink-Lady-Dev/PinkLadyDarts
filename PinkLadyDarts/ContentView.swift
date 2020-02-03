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
        HStack(spacing: 0) {
            
            VStack {
                CustomTextButton(btnText: "Miss", actionText: 0)
                CustomTextButton(btnText: "Bull \n (25)",  actionText: 0)
                CustomTextButton(btnText: "Bull \n (50)", actionText: 0)
            }
                

            VStack {
                
                HStack(spacing: 0) {
                    CustomButton(btnText: "20", actionText: 20)
                    CustomButton(btnText: "19", actionText: 19)
                    CustomButton(btnText: "18", actionText: 18)
                    CustomButton(btnText: "17", actionText: 17)
                }
                
                HStack(spacing: 0) {
                    CustomButton(btnText: "16", actionText: 16)
                    CustomButton(btnText: "15", actionText: 15)
                    CustomButton(btnText: "14", actionText: 14)
                    CustomButton(btnText: "13", actionText: 13)
                }
                
                HStack(spacing: 0) {
                    CustomButton(btnText: "12", actionText: 12)
                    CustomButton(btnText: "11", actionText: 11)
                    CustomButton(btnText: "10", actionText: 10)
                    CustomButton(btnText: "9", actionText: 9)
                }
                HStack(spacing: 0) {
                    CustomButton(btnText: "8", actionText: 8)
                    CustomButton(btnText: "7", actionText: 7)
                    CustomButton(btnText: "6", actionText: 6)
                    CustomButton(btnText: "5", actionText: 5)
                }
                HStack(spacing: 0) {
                    CustomButton(btnText: "4", actionText: 4)
                    CustomButton(btnText: "3", actionText: 3)
                    CustomButton(btnText: "2", actionText: 2)
                    CustomButton(btnText: "1", actionText: 1)
                }
                
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

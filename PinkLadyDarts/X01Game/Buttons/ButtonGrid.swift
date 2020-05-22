//
//  ButtonGrid.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct ButtonGrid: View {
    
    @ObservedObject var X01GameVM: X01GameViewModel
    
    var body: some View {
        
        ZStack {
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    ButtonView(X01GameVM: self.X01GameVM, btnTextObj: AnyView(Text("Miss")
                        .font(.system(size: 20)).bold()
                        .multilineTextAlignment(.center)
                        .fixedSize()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.PLTextGrey)), btnType: 1, btnVal: 0, hasContextMenu: false)
                    
                    ButtonView(X01GameVM: self.X01GameVM, btnTextObj: AnyView(Text("Bull\n(25)")
                        .font(.system(size: 20)).bold()
                        .multilineTextAlignment(.center)
                        .fixedSize()
                        .frame(width: 10, height: 80)
                        .foregroundColor(Color.PLTextGrey)), btnType: 2, btnVal: 25, hasContextMenu: false)
                    
                    ButtonView(X01GameVM: self.X01GameVM, btnTextObj: AnyView(Text("Bull\n(50)")
                        .font(.system(size: 20)).bold()
                        .multilineTextAlignment(.center)
                        .fixedSize()
                        .frame(width: 10, height: 80)
                        .foregroundColor(Color.PLTextGrey)), btnType: 1, btnVal: 50, hasContextMenu: false)
                }
                
                ForEach([[20, 16, 12, 8, 4], [19, 15, 11, 7, 3], [18, 14, 10, 6, 2], [17, 13, 9, 5, 1]], id:\.self) { arr in
                    VStack() {
                        ForEach(arr, id:\.self) { row in
                            
                            ButtonView(X01GameVM: self.X01GameVM, btnTextObj: AnyView(Text("\(row)")
                                .font(.largeTitle)
                                .fixedSize()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color.PLTextGrey)), btnType: 2, btnVal: row)
                            
                        }
                    }
                }
                
            }
                
            .frame(width: 370, height: 400)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct ButtonGrid_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGrid(X01GameVM: X01GameViewModel(startingX01Points: 301))
    }
}

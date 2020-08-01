//
//  CricketGameView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 5/22/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct CricketGameView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var CricketGameVM: CricketGameViewModel
    
    var body: some View {
        ZStack {
            
            LinearGradient(Color.PLDarkGradientStart, Color.PLDarkGradientEnd).edgesIgnoringSafeArea(.all)
            
            HStack(spacing: 0) {
                
                VStack(spacing: 0) {
                    
                    HStack(spacing: 0) {
                        
                        // add conditional for turn coloring
                        // probably make this its own scoreboard view like X01
                        Rectangle().fill(Color.PLPink).frame(width: 117.5, height: 70).border(Color.black)
                        Rectangle().fill(Color.PLGrey).frame(width: 117.5, height: 70).border(Color.black)
                        
                    }

                    ForEach(0...6, id: \.self) { i in
                        
                        HStack(spacing: 0) {
                            self.getView(i: i)
                            self.getView(i: i)
                        }
                        
                        
                    }
                }.offset()
                
                // Button Stack
                VStack {
                    
                    HStack(spacing: 0) {
                        // miss | <-
                        ButtonView(GameVM: self.CricketGameVM, btnTextObj: AnyView(Text("Miss")
                            .font(.system(size: 20)).bold()
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.PLTextGrey)), btnType: 1, btnVal: 0, hasContextMenu: false)
                        
                        SimpleButtonView(btnText: "<--", btnType: 1, txtWidth: 10, txtHeight: 10, btnAction: {print("back")}, GameVM: self.CricketGameVM)
                    }
                    
                    HStack(spacing: 0) {
                        // Numbers
                        VStack {
                            ForEach([[20, 19, 18, 17, 16, 15]], id:\.self) { arr in
                                ForEach(arr, id:\.self) { row in
                                    
                                    ButtonView(GameVM: self.CricketGameVM, btnTextObj: AnyView(Text("\(row)")
                                        .font(.largeTitle)
                                        .fixedSize()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(Color.PLTextGrey)), btnType: 2, btnVal: row)
                                    
                                }
                                
                            }
                        }
                        
                        SimpleButtonView(btnText: " Next\nPlayer", btnType: 2, txtWidth: 10, txtHeight: 360, btnAction: { print("next") }, GameVM: CricketGameVM)
                    }
                    
                    
                    // Bullseye
                    HStack(spacing:0) {
                        
                        ButtonView(GameVM: self.CricketGameVM, btnTextObj: AnyView(Text("Bull\n.")
                            .font(.system(size: 20)).bold()
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.PLTextGrey)), btnType: 1, btnVal: 25, hasContextMenu: false)
                        
                        ButtonView(GameVM: self.CricketGameVM, btnTextObj: AnyView(Text("Bull\n..")
                            .font(.system(size: 20)).bold()
                            .multilineTextAlignment(.center)
                            .fixedSize()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.PLTextGrey)), btnType: 2, btnVal: 25, hasContextMenu: false)
                        
                    }
                }
                
            }
            
        }.edgesIgnoringSafeArea(.all)
        
        
    }
    
    func getView (i: Int) -> (AnyView) {
        if (i % 2 == 0) {
            return AnyView( Rectangle().fill(Color.PLGrey).frame(width: 117.5, height: 70).border(Color.black))
        }
        else {
            return AnyView( Rectangle().fill(Color.gray).frame(width: 117.5, height: 70).border(Color.black))
        }
    }
}

struct CricketGameView_Previews: PreviewProvider {
    static var previews: some View {
        CricketGameView(viewRouter: ViewRouter(), CricketGameVM: CricketGameViewModel(startingPoints: 0))
    }
}

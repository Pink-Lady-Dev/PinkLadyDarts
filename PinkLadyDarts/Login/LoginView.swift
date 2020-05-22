//
//  LoginView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 5/21/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack() {
            Text("Sign In")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: self.$email)
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color.PLTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                SecureField("Password", text: self.$password)
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color.PLTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            
            // TODO: Set up sign in action that actually submits credentials
            //       Then redirects to the main menu
            Button(action: {self.viewRouter.currentPage = "mainMenu"}) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.PLPink)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
            
            Button(action: {self.viewRouter.currentPage = "mainMenu"}) {
                Text("Main Menu")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.PLPink)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 25)
            
            Spacer()
            HStack(spacing: 0) {
                Text("Don't have an account? ").foregroundColor(.white)
                Button(action: {}) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                }
            }
        }
        .background(
            Color.PLGrey
                .edgesIgnoringSafeArea(.all))
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter())
    }
}

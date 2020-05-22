//
//  LoginViewModel.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 5/21/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func performLogin() {
        print("login performed")
    }
}

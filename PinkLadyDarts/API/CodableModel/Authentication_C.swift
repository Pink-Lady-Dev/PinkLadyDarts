//
//  Authenticate_C.swift
//  PinkLadyDarts
//
//  Created by Jacob Carlson on 3/30/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

final class Authentication_C: Codable {
    var username: String
    var password: String
    
    // Strip as much out of this as possible
    init (username: String, password: String){
        self.username = username
        self.password = password
    }

}


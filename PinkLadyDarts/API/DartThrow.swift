//
//  DartThrow.swift
//  Darts_Client
//
//  Created by Jacob Carlson on 2/10/20.
//  Copyright © 2020 Jacob Carlson. All rights reserved.
//

import Foundation

final class DartThrow: Codable {
    
    var player: User_C
    var throwNumber: Int
    var pie: Int
    var isDouble: Bool
    var isTriple: Bool
    
    init (player: User_C, throwNumber: Int, pie: Int, isDouble: Bool, isTriple: Bool){
        self.player = player
        self.throwNumber = throwNumber
        self.pie = pie
        self.isDouble = isDouble
        self.isTriple = isTriple
    }
}

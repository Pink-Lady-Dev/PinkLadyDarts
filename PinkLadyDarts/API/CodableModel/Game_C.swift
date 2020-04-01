//
//  Game_C.swift
//  PinkLadyDarts
//
//  Created by Jacob Carlson on 3/25/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation


final class Game_C: Codable {
    
    var id: String
    var users: [String]
    var gameType: String
    
    init (id: String, users: [User_C], gameType: String)
    {
        self.id = id
        
        let userIds = users.map({ (value: User_C) ->String in
            return value.id
        })
        print(userIds)
        self.users = userIds
        self.gameType = gameType
    }
    
    init (id: String, userIds: [String], gameType: String)
    {
        self.id = id
        self.users = userIds
        self.gameType = gameType
    }
}


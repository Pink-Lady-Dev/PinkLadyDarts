//
//  User_C.swift
//  PinkLadyDarts
//
//  Created by Jacob Carlson on 3/25/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

final class User_C: Codable {
    var id: String
    var name: String
    
    var enabled: Bool
    var accountNonExpired: Bool
    var accountNonLocked: Bool
    var credentialsNonExpired: Bool
    
    // Strip as much out of this as possible
    init (name: String, id: String, enabled: Bool, accountNonExpired:Bool, accountNonLocked:Bool, credentialsNonExpired:Bool){
        self.name = name
        self.id = id
        
        self.enabled = enabled
        self.accountNonExpired = accountNonExpired
        self.accountNonLocked = accountNonLocked
        self.credentialsNonExpired = credentialsNonExpired
        
    }
    
}

//
//  Game.swift
//  PinkLadyDarts
//
//  Created by Jacob Carlson on 3/25/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

// Standardize this with Nick, make it in its own file
// then write toString method for it
enum GAME_TYPE {
    case X01
}

func newGame (){
    do {
        let url = createURL(address: "http://localhost:8181/game")
        var urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)
        
        let jake = User_C(
            name: "Jakeocinc",
            id: "8d04b16a-0d39-407d-a087-8926a9e2fcfa",
            enabled: true,
            accountNonExpired: true,
            accountNonLocked: true,
            credentialsNonExpired: true
        );
        
        let nick = User_C(
            name: "NickClason85",
            id: "45d87a87-b077-4286-b37f-35c5e30eed2b",
            enabled: true,
            accountNonExpired: true,
            accountNonLocked: true,
            credentialsNonExpired: true
        );
        
        
        let game = Game_C(
            id: "522a9f51-b8fa-4878-bf67-821d27b72af4",
            users: [jake, nick],
            gameType: "XO1"
        );
        
        urlRequest.httpBody = try JSONEncoder().encode(game)
        
        POST(request: urlRequest, completion: {
            result in switch result
            {
                case .success(_):
                    print("Successfull send.")
                case .failure(let error):
                    print("Error Occured:\(error)")
            }
        })
    } catch {
        print("Encoding Issue")
    }
    
}





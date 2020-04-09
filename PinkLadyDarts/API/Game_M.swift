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

class GameAPI: ObservableObject
{

    @Published private var id: String
    @Published private var users: [String: User] = [:]
    
    let jwt : String
    let gameId = "testID"
    
    @Published private var gameType: GAME_TYPE
    
    init(users: [User]){
        self.id = UUID().uuidString;
        self.gameType = GAME_TYPE.X01;
        self.jwt = ""
        
        for user in users {
            print(user.getId())
            print(user.getUsername())
            self.users.updateValue(user, forKey: user.getUsername())
        }
    }
    
    func newGame() {
        gamePOST(game_c: Game_C(
                    id: gameId,
                    userIds: self.users.map ({ (key, value) in
                        return value.getId()
                    }),
                    gameType: "X01"),
                 jwt: self.getJwt())
    }
    
    func throwDart(user: User, throwNumber: Int, pie: Int, isDouble: Bool, isTriple: Bool) {
        
        let dart_c = Dart_C(player: user.getCodable(), throwNumber: throwNumber, pie: pie, isDouble: isDouble, isTriple: isTriple)
        
        // change to user.jwt
        dartPOST(dart_c: dart_c, gameId: gameId, jwt: getJwt())
        
    }
    
    /*   GETTERS   */
    func getUsers() -> [String: User]{
        return self.users;
    }
    
    func getJwt() -> String {
        if (self.users["Jakeocinco"] != nil){
            return self.users["Jakeocinco"]?.getJWT() ?? "default value"
        }
        return ""
    }
}

private func gamePOST (game_c: Game_C, jwt: String){
    
    do {
        let url = createURL(address: "http://localhost:8181/game")
        var urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)
        urlRequest.addValue("Bearer  " + jwt, forHTTPHeaderField: "Authorization")
    
        urlRequest.httpBody = try JSONEncoder().encode(game_c)
        
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

private func dartPOST (dart_c: Dart_C, gameId: String, jwt: String){
    
    do {
        let url = createURL(address: "http://localhost:8181/game/" + gameId + "/user/" + dart_c.player.id)
        var urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)
        urlRequest.addValue("Bearer  " + jwt, forHTTPHeaderField: "Authorization")
    
        urlRequest.httpBody = try JSONEncoder().encode(dart_c)
        
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

/*  TEST CODE  */

func testGame () -> Game_C {
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
    
    return game;
}

//func testPOST() {
//    gamePOST(game_c: testGame())
//}

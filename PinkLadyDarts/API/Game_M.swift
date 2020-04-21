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
    var gameId : String
    
    @Published private var gameType: GAME_TYPE
    
    init(users: [User]){
        self.id = UUID().uuidString;
        self.gameType = GAME_TYPE.X01;
        self.jwt = "";
        self.gameId = "";
        
        for user in users {
            self.users.updateValue(user, forKey: user.getUsername())
        }

        newGame()
    }
    
    private func newGame() {
        self.gameId = UUID().uuidString.lowercased()

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
        return "";
    }
    
    func getGameUUID() -> String {
        return self.gameId;
    }
    
    /*   HTTP METHODS  */
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
}

//
//  DartThrow.swift
//  Darts_Client
//
//  Created by Jacob Carlson on 2/10/20.
//  Copyright © 2020 Jacob Carlson. All rights reserved.
//

import Foundation

func sendDart(dartThrow: DartThrow){
    do {
        var urlRequest = createURLRequest(address: "http://localhost:8080/api/v1/darts", requestType: Request_Type.POST)
        urlRequest.httpBody = try JSONEncoder().encode(dartThrow)
        
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
        print("Decoding issue.")
    }
}

final class DartThrow: Codable {
    
    var player: User
    var throwNumber: Int
    var pie: Int
    var isDouble: Bool
    var isTriple: Bool
    
    init (player: User, throwNumber: Int, pie: Int, isDouble: Bool, isTriple: Bool){
        self.player = player
        self.throwNumber = throwNumber
        self.pie = pie
        self.isDouble = isDouble
        self.isTriple = isTriple
    }
}

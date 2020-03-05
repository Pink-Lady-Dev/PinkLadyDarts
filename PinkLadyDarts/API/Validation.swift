//
//  Validation.swift
//  PinkLadyDarts
//
//  Created by Jacob Carlson on 3/4/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation

func authorize(dartThrow: DartThrow){
    do {
        let url = createURL(
            address: "http://localhost:8181/oauth/token",
            requestType: Request_Type.POST,
            params: ["grant_type":"password",
                     "username":"fakeusername",
                     "password":"password"])
        
        let authConfig = authorization(login: "fake", key: "fake")
        let urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)
        
        POSTwithSessionConfiguration(request: urlRequest, sessionConfig: authConfig, completion: {
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

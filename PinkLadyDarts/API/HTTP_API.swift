//
//  HTTP_API.swift
//  Darts_Client
//
//  Created by Jacob Carlson on 1/30/20.
//  Copyright © 2020 Jacob Carlson. All rights reserved.
//

import Foundation

enum APIError:Error {
    case responceProblem
//    case decodingProblem
    case encodingProblem
}

enum Request_Type {
    case POST
    case GET
}

func createURLRequest(address : String, requestType: Request_Type) -> URLRequest {
    
    let resourceString = address
    guard let resourceURL = URL(string: resourceString) else {fatalError()}
    
    var urlRequest = URLRequest(url: resourceURL)
    
    if (requestType == Request_Type.POST) {
        urlRequest.httpMethod = "POST"
    } else if (requestType == Request_Type.GET) {
        urlRequest.httpMethod = "GET"
    }
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    return urlRequest;
}

func POST (request: URLRequest, completion: @escaping(Result<Void, APIError>) -> Void){
    
    let dataTask = URLSession.shared.dataTask(with: request){
        data, responce, _ in
        
        guard let httpResponce = responce as? HTTPURLResponse, httpResponce.statusCode == 200, let _ = data else{
            completion(.failure(.responceProblem))
            return
        }
        
        completion(.success(Void()))
    }
    dataTask.resume()
}

func GET (request: URLRequest, completion: @escaping(Result<Data, APIError>) -> Void) {
    
    let dataTask = URLSession.shared.dataTask(with: request){
        data, responce, _ in
        
        guard let httpResponce = responce as? HTTPURLResponse, httpResponce.statusCode >= 200, let _ = data else{
            completion(.failure(.responceProblem))
            return
        }
        
        completion(.success(data!))
    }
    dataTask.resume()
}

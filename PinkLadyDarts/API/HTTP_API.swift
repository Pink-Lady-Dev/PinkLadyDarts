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


func createURL(address : String) -> NSURL {
    
    guard let resourceURL = NSURL(string: address) else {fatalError()}
    
    return resourceURL
}

func createURL(address : String, params: [String:String]) -> NSURL {
    
    var resourceString = address + "?"

    for (key, value) in params{
        resourceString += (key + "=" + value + "&")
    }
    
    resourceString.removeLast()
    
    guard let resourceURL = NSURL(string: resourceString) else {fatalError()}
    
    return resourceURL
}

func authorization(login: String, key: String) -> URLSessionConfiguration {
    
    // eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqYWtlb2NpbmNvIiwiZXhwIjoxNTgzOTc5MjY5LCJpYXQiOjE1ODM4OTI4Njl9.LswTLR_WCkUD1fKUwza81fOOKn1ndfNjEWMf1mMyIFbNrd-OmuUM3KQbK3VUZSzkuzsZwU0n2XoDZzr1xjaNxA
        let config = URLSessionConfiguration.default
//    let userPasswordString = "\(login):\(key)"
//    let userPasswordData = userPasswordString.data(using: String.Encoding.utf8)
//    let base64EncodedCredential = userPasswordData!.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    let authString = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqYWtlb2NpbmNvIiwiZXhwIjoxNTgzOTc5MjY5LCJpYXQiOjE1ODM4OTI4Njl9.LswTLR_WCkUD1fKUwza81fOOKn1ndfNjEWMf1mMyIFbNrd-OmuUM3KQbK3VUZSzkuzsZwU0n2XoDZzr1xjaNxA"
    //\(base64EncodedCredential)"

    config.httpAdditionalHeaders = ["Authorization" : authString]
    
    return config
}

func createURLRequest(url : NSURL, requestType: Request_Type) -> URLRequest {
    
    // LEt this read from a static variable set on login becuase this will change constantly
    let authString = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJKYWtlb2NpbmNvIiwiZXhwIjoxNTg1NjE1NDQxLCJpYXQiOjE1ODU1MjkwNDF9.BmaMzzzIpILuEPz9GfFqX16ZTlR2eaeZUFMtpVGGQyXFIh1H1RenhFsl3iVNt9PKP5S66rOs71NANw7xBIlOTw"
    
    var urlRequest = URLRequest(url: url as URL)
    
    if (requestType == Request_Type.POST) {
        urlRequest.httpMethod = "POST"
    } else if (requestType == Request_Type.GET) {
        urlRequest.httpMethod = "GET"
    }
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    if (true){
        urlRequest.addValue("Bearer " + authString, forHTTPHeaderField: "Authorization")
    }
    
    return urlRequest;
}


func POSTwithSessionConfiguration (request: URLRequest, sessionConfig: URLSessionConfiguration, completion: @escaping(Result<Void, APIError>) -> Void){
    
    let session = URLSession(configuration: sessionConfig)
    let dataTask = session.dataTask(with: request){
        data, responce, _ in
        
        guard let httpResponce = responce as? HTTPURLResponse, httpResponce.statusCode == 200, let _ = data else{
            completion(.failure(.responceProblem))
            return
        }
        
        completion(.success(Void()))
    }
    dataTask.resume()
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

func GETwithSessionConfiguration (request: URLRequest, sessionConfig: URLSessionConfiguration, completion: @escaping(Result<Data, APIError>) -> Void) {
    
    let session = URLSession(configuration: sessionConfig)
    let dataTask = session.dataTask(with: request){
        data, responce, _ in
        
        guard let httpResponce = responce as? HTTPURLResponse, httpResponce.statusCode >= 200, let _ = data else{
            completion(.failure(.responceProblem))
            return
        }
        
        completion(.success(data!))
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


//
//  Users.swift
//  Darts_Client
//
//  Created by Jacob Carlson on 2/10/20.
//  Copyright © 2020 Jacob Carlson. All rights reserved.
//

import Foundation

class Users: ObservableObject {
    
    @Published private var users = [User]()
    
    func fromJSON (jsonData : Data) -> [User]{
        
        let json = try? JSONSerialization.jsonObject(with: jsonData, options: [])
        let jsonArr = json as! NSArray;
        var tempUsers = [User](); //User(name: "temp", id: "1");
        
        for j in jsonArr{
            let dict = j as! NSDictionary
            tempUsers.append(User(name: dict["name"] as! String,id: dict["id"] as! String))
        }
        
        return tempUsers
    }
    
    func setUsers () {
        
        let urlRequest = createURLRequest(address: "http://localhost:8080/api/v1/user", requestType: Request_Type.GET)
        
        GET(request: urlRequest, completion:{
            result in switch result
            {
                case .success(let data):
                    
                    self.users = self.fromJSON(jsonData: data);
                    print("Successfull send.")
                
                case .failure(let error):
                    print("Error Occured:\(error)")
            }
        });
    }
    
    func getUsers () -> [User] {
        return users;
    }
}

final class User: Codable {
    var id: String?
    var name: String
    
    init (name: String){
        self.name = name
    }
    
    init (name: String, id: String){
        self.name = name
        self.id = id
    }
    
}

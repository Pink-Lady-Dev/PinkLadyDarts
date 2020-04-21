//
//  Users.swift
//  Darts_Client
//
//  Created by Jacob Carlson on 2/10/20.
//  Copyright © 2020 Jacob Carlson. All rights reserved.
//

import Foundation

class Users: ObservableObject {
    
    @Published private var users = [User_C]()
    
    func fromJSON (jsonData : Data) -> [User_C]{
        
        let json = try? JSONSerialization.jsonObject(with: jsonData, options: [])
        let jsonArr = json as! NSArray;
        var tempUsers = [User_C](); //User(name: "temp", id: "1");
        
        for j in jsonArr{
            let dict = j as! NSDictionary
            tempUsers.append(User_C(name: dict["name"] as! String,
                                  id: dict["id"] as! String,
                                  enabled: dict["enabled"] as! Bool,
                                  accountNonExpired: dict["accountNonExpired"] as! Bool,
                                  accountNonLocked: dict["accountNonLocked"] as! Bool,
                                  credentialsNonExpired: dict["credentialsNonExpired"] as! Bool))
        }
        
        return tempUsers
    }
    
    func setUsers () {
        
        let url = createURL(address: "http://localhost:8080/user/all")
        let urlRequest = createURLRequest(url: url, requestType: Request_Type.GET)
//        let urlRequest = createURLRequest(address: "http://localhost:8080/api/v1/user", requestType: Request_Type.GET)
//
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
    
    func getUsers () -> [User_C] {
        return users;
    }
}


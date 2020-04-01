//
//  User_M.swift
//  PinkLadyDarts
//
//  Created by Jacob Carlson on 3/30/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import Foundation


class User: ObservableObject
{
    // TODO - Rename to user $?
    // TODO - Consider replacing most of these with just a user type
    //            This change wouldn't be user facing but make it easier
    //            and have less  observables
    @Published private var JWT_TOKEN: String
    
    @Published private var user: User_C
    
    init () {
        self.JWT_TOKEN = "EMPTY"
        self.user        = User_C(
            name: "null",
            id: "null",
            enabled: false,
            accountNonExpired: false,
            accountNonLocked: false,
            credentialsNonExpired: false
        )
    }
    
    func connect (username: String, password: String) {
        do {
            let url = createURL(address: "http://localhost:8181/authenticate")
            var urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)
            
            urlRequest.addValue("xxx", forHTTPHeaderField: "Secret")
            
            urlRequest.httpBody = try JSONEncoder().encode(
                Authentication_C(username: username, password: password)
            )
            
            POST(request: urlRequest, completion: {
                result in switch result
                {
                case .success(let data):
                        print("Successfull send.")
                    
                        print(data)
                        self.JWT_TOKEN = User.parseJWT   (jsonData: data)
                        self.user      = User.parseUser_C(jsonData: data)

                    
                    
                    case .failure(let error):
                        print("Error Occured:\(error)")
                }
            })
        } catch {
            print("Encoding Issue")
        }
    }
    
    
    
    /* Parsing Functions */
    
    private static func parseJWT (jsonData : Data) -> String{
        
        let json = try? JSONSerialization.jsonObject(with: jsonData, options: [])
        
        let dict = json as! NSDictionary
        
        return dict["jwt"] as! String
    }
    
    private static func parseUser_C (jsonData : Data) -> User_C{
        
        let json = try? JSONSerialization.jsonObject(with: jsonData, options: [])
        let dict = json as! NSDictionary
        let userDict = dict["user"] as! NSDictionary
        
        return User_C(
            name:                  userDict["name"] as! String,
            id:                    userDict["id"] as! String,
            enabled:               userDict["enabled"] as! Bool,
            accountNonExpired:     userDict["accountNonExpired"] as! Bool,
            accountNonLocked:      userDict["accountNonLocked"] as! Bool,
            credentialsNonExpired: userDict["credentialsNonExpired"] as! Bool
        )
    }
    
    /* Getters */
    func getJWT() -> String {
        return JWT_TOKEN;
    }
    
    func getUsername() -> String {
        return user.name;
    }
    
    func getId() -> String {
        return user.id;
    }
}


func userPOST (user_c: User_C){
    
    do {
        let url = createURL(address: "http://localhost:8181/user")
        var urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)
        
        urlRequest.addValue("xxx", forHTTPHeaderField: "Secret")
        
        urlRequest.httpBody = try JSONEncoder().encode(user_c)
        
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

func authenticate (user_c: User_C){
    
    do {
        let url = createURL(address: "http://localhost:8181/user")
        var urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)
        
        urlRequest.addValue("xxx", forHTTPHeaderField: "Secret")
        
        urlRequest.httpBody = try JSONEncoder().encode(user_c)
        
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

func randomUser () -> User_C {
    return User_C(
        name: "RandomTestUser_" + String(Int.random(in: 0 ... 99)),
        id: UUID().uuidString,
        enabled: true,
        accountNonExpired: true,
        accountNonLocked: true,
        credentialsNonExpired: true
    );
}

func testUserPOST() {
    userPOST(user_c: randomUser())
}

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
    @Published private var jwt: String
    @Published private var name: String
    
    @Published private var user: User_C
    
    init (name: String) {
        // These are only used for online users
        self.jwt  = "null"
        self.user = User_C(
            name: "null",
            id: "null",
            enabled: false,
            accountNonExpired: false,
            accountNonLocked: false,
            credentialsNonExpired: false
        )

        self.name = name
    }

    init (name: String, password: String, isNewUser: Bool) {

        // These are only used for online users
        self.jwt  = "null"
        self.user = User_C(
            name: "null",
            id: "null",
            enabled: false,
            accountNonExpired: false,
            accountNonLocked: false,
            credentialsNonExpired: false
        )
        self.name = name

        if (isNewUser){
            userPOST(password: password)
        }
        authenticatePost(password: password)
    }

    func authenticatePost (password: String) {
        do {
            let url = createURL(address: "http://localhost:8181/authenticate")
            var urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)
            
            // TODO Change this to an enviornment variable or something
            urlRequest.addValue("xxx", forHTTPHeaderField: "Secret")
            
            urlRequest.httpBody = try JSONEncoder().encode(
                Authentication_C(username: self.name, password: password)
            )
            
            POST(request: urlRequest, completion: {
                result in switch result
                {
                    case .success(let data):
                        print("Successfull send.")
                    
                        print(data)
                        self.jwt  = User.parseJWT   (jsonData: data)
                        self.user = User.parseUser_C(jsonData: data)
        
                    case .failure(let error):
                        print("Error Occured:\(error)")
                }
            })
        } catch {
            print("Encoding Issue")
        }
    }
    
    func userPOST (password: String){
        do {
            let url = createURL(address: "http://localhost:8181/user")
            var urlRequest = createURLRequest(url: url, requestType: Request_Type.POST)

            urlRequest.addValue("xxx", forHTTPHeaderField: "Secret")
            
            urlRequest.httpBody = try JSONEncoder().encode(
                User_C_POSTONLY(
                    name:     self.name,
                    password: password
            ))

            POST(request: urlRequest, completion: {
                result in switch result
                {
                case .success(_):
                        print("Successfull send.")
                    case .failure(let error):
                        print("Error Occured: \(error)")
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
    
    /* Checks */
    
    func validJWT() -> Bool{
        return getJWT().count > 0
    }
    
    /* Getters */

    func getJWT() -> String {
        return jwt;
    }
    
    func getUsername() -> String {
        return user.name;
    }
    
    func getId() -> String {
        return user.id;
    }
    
    func getCodable() -> User_C {
        return user;
    }
}

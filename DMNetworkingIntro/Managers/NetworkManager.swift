//
//  NetworkManager.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import Foundation

/**
 3.1 Create a protocol called `NetworkManagerDelegate` that contains a function called `usersRetrieved`.. This function should accept an array of `User` and should not return anything.
 */

protocol NetworkManagerDelegate {
    func usersRetrieved(users: [User])
}

class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://reqres.in/api/"
    
    private init() {}
    
    var delegate: NetworkManagerDelegate?
    
    
    
    func getUsers() {
        
        let userURL = "\(baseUrl)users"
        
        if let url = URL(string: userURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with:  url) { data, response, error in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data {
                    do {
                     let userData = try decoder.decode(UserResponse.self, from: data)
                        self.delegate?.usersRetrieved(users: userData.data)
                    } catch {
                        print("Error getting users data \(error)")
                    }
                }
            }
            
            
            task.resume()
        }
    }
}

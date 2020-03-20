//
//  API.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/17.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation
import Alamofire

struct API {
    
    private let token = Session.shared.token
    
    private let authURL = "https://oauth.vk.com"
    private let baseURL = "https://api.vk.com"
    
    private let version = "5.103"

    /// TODO: change to Alamofire later
    mutating func logIn() -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7360980"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends, photos, groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        
        return URLRequest(url: urlComponents.url!)
    }
    
    func fetchFriendsList() {
        let path = "/method/friends.get"
        let parameters: Parameters = [
            "access_token" : token,
            "v" : version
        ]
        
        let url = baseURL + path
        AF.request(url, parameters: parameters).responseJSON { response in
            print("response: Friend         :        \(response)")
        }
    }
    
    func fetchGroupList() {
        let path = "/method/groups.get"
        let parameters: Parameters = [
            "extended" : 1,
            "access_token" : token,
            "v" : version
        ]
        
        let url = baseURL + path
        AF.request(url, parameters: parameters).responseJSON { response in
            print("response: Group         :        \(response)")
        }
    }
    
    func fetchUserPhoto() {
        let path = "/method/photos.getAll"
        let parameters: Parameters = [
            "owner_id" : "587468244",
            "access_token" : token,
            "v" : version
        ]
           
        let url = baseURL + path
        AF.request(url, parameters: parameters).responseJSON { response in
            print("response: Photos         :        \(response)")
        }
    }

    func fetchSearched(group: String) {
        let path = "/method/groups.search"
        let parameters: Parameters = [
            "q" : group,
            "type" : "group",
            "access_token" : token,
            "v" : version
        ]
           
        let url = baseURL + path
        AF.request(url, parameters: parameters).responseJSON { response in
            print("response: Photos         :        \(response)")
        }
    }
    
}

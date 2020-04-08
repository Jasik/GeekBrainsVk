//
//  API.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/17.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

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
    
    func fetchFriendsList(_ completion: @escaping () -> Void) {
        let path = "/method/friends.get"
        let parameters: Parameters = [
            "fields" : "nickname, photo_100", 
            "access_token" : token,
            "v" : version
        ]
        
        let url = baseURL + path
        
        AF.request(url, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let friends = try decoder.decode(FriendsResponse.self, from: data)
                self.safeData(from: friends.response.items)
                
                completion()
            } catch {
                print(error)
            }
        }
    }
    
    func fetchGroupList(_ completion: @escaping () -> Void) {
        let path = "/method/groups.get"
        let parameters: Parameters = [
            "extended" : 1,
            "access_token" : token,
            "v" : version
        ]
        
        let url = baseURL + path

        AF.request(url, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let groups = try decoder.decode(GroupResponse.self, from: data)
                
                print(groups.response.items)
                
                completion(groups.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    func fetchUserPhoto(_ completion: @escaping ([Photo]) -> Void) {
        let path = "/method/photos.getAll"
        let parameters: Parameters = [
            "owner_id" : "587468244",
            "extended" : 0,
            "photo_sizes" : 1,
            "access_token" : token,
            "v" : version
        ]
           
        let url = baseURL + path

        AF.request(url, parameters: parameters).responseData { response in

            guard let data = response.value else { return }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let photos = try decoder.decode(PhotoResponse.self, from: data)

                print(photos.response.items)
                completion(photos.response.items)
            } catch {
                print(error)
            }
        }
    }

    func fetchSearched(group: String, _ completion: @escaping ([Group]) -> Void) {
        let path = "/method/groups.search"
        let parameters: Parameters = [
            "q" : group,
            "type" : "group",
            "access_token" : token,
            "v" : version
        ]
           
        let url = baseURL + path
       AF.request(url, parameters: parameters).responseData { response in
            
            guard let data = response.value else { return }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let groups = try decoder.decode(GroupResponse.self, from: data)
                
                print(groups.response.items)
                
                completion(groups.response.items)
            } catch {
                print(error)
            }
        }
    }
}

  /// TODO: create a normal manager
    
//    enum EndPoint {
//        static let authURL = URL(string: "https://oauth.vk.com/")!
//
//        case oauth
//
//        var url: URL {
//            switch self {
//            case .oauth:
//                return EndPoint.authURL
//            }
//        }
//    }

//enum MetodAndParameters {
//     case friends
//     case photos
//     case groups
//
//     func method() -> String {
//         switch self {
//         case .friends:
//             return "friends.get"
//         case .photos:
//             return "photos.getAll"
//         case .groups:
//             return "groups.get"
//         }
//     }
//
//     func parameters() -> Parameters {
//         switch self {
//         case .friends:
//             return [:]
//         case .photos:
//             return [:]
//         case .groups:
//             return [:]
//         }
//     }
// }

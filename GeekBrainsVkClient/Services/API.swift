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

struct ApiEndPoint {
    
    static let baseURL = "https://api.vk.com"
    
    static let token = Session.shared.token
    static let version = "5.103"
    
    enum EndPoint {
        case groups
        case friends
        case photo
        case searchGroups(group: String)
        
        var path: String {
            switch self {
            case .friends:
                return baseURL + "/method/friends.get"
            case .groups:
                return baseURL + "/method/groups.get"
            case .photo:
                return baseURL + "/method/photos.getAll"
            case .searchGroups(_):
                return baseURL + "/method/groups.search"
            }
        }
        
        var parameters: Parameters {
            switch self {
            case .friends:
                return ["fields" : "nickname, photo_100", "access_token" : token, "v" : version]
            case .groups:
                return ["extended" : 1, "access_token" : token, "v" : version]
            case .photo:
                return ["owner_id" : "587468244", "extended" : 0, "photo_sizes" : 1, "access_token" : token, "v" : version]
            case .searchGroups(let group):
                return ["q" : group, "type" : "group", "access_token" : token, "v" : version]
            }
        }
    }
}

class ApiManager {
    
    func fecthData<T: Codable & Object>(endPoint: ApiEndPoint.EndPoint, model: T.Type, _ completion: @escaping ([T]) -> Void) {
        
        AF.request(endPoint.path, parameters: endPoint.parameters).responseJSON { response in
            
            guard
                let dict = response.value as? [String : Any],
                let dictResponse = dict["response"] as? [String : Any],
                let dictItems = dictResponse["items"],
                let data = try? JSONSerialization.data(withJSONObject: dictItems, options: [])
            else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let result = try! decoder.decode([T].self, from: data)

            completion(result)
        }
    }
    
    func fetchGroup() {
        
        self.fecthData(endPoint: .groups, model: Group.self, { [weak self] groups in
            self?.saveData(from: groups)
        })
    }
    
    func fetchFriend() {
        
        self.fecthData(endPoint: .friends, model: Friend.self, { [weak self] friends in
            self?.saveData(from: friends)
        })
    }
    
    func fetchPhoto() {
        
        self.fecthData(endPoint: .photo, model: Photo.self, { [weak self] photos in
            self?.saveData(from: photos)
        })
    }

}

extension ApiManager {
    
    func logIn() -> URLRequest {
        
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
    
    func saveData<T: Object>(from data: [T]) {
        
        do {
            let realm = try Realm()
            let realmObjects = realm.objects(T.self)
            
            realm.beginWrite()
            realm.delete(realmObjects)
            realm.add(data, update: .all)
            
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}

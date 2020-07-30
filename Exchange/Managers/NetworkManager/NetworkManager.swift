//
//  NetworkManager.swift
//  iliaNetworking
//
//  Created by Dima Biliy on 03.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func obtainPost<T: Decodable>(url : String, completion: @escaping (ObtainPostResult<T>)->())
}

enum ObtainPostResult<T>{
    case success(posts: T)
    case failure(error: Error)
    case faile(someError: String)
}

class NetworkManager: NetworkProtocol{
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func obtainPost<T: Decodable>(url : String, completion: @escaping (ObtainPostResult<T>)->()){
        
        guard let url = URL(string: url) else {return}
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            
            var result: ObtainPostResult<T>
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let strondSelf = self else {
                result = .failure(error: error!)
                return
            }
            if error == nil, let patsData = data{
                guard let posts = try? strondSelf.decoder.decode(T.self, from: patsData) else {
                    result = .faile(someError: "Опять массив в структуру, или наоборот пытаешься распарсить...")
                    return
                }
                result = .success(posts: posts)
            } else {
                result = .failure(error: error!)
            }
        }.resume()
    }
}



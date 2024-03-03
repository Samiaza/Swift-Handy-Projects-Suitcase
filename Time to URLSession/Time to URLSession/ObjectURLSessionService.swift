//
//  ObjectURLSessionService.swift
//  quest1
//
//  Created by Gemma Emery on 02-03-2024.
//

import Foundation

class ObjectURLSessionService: IObjectService {
    typealias ObjectType = FlightsData
    var baseUrl: URL
    init?(baseUrl: String) {
        guard let url = URL(string: baseUrl + "?api_key=YOUR-API-KEY") else {
            return nil
        }
        self.baseUrl = url
    }
    
    func fetchObjects(completion: @escaping (ObjectType?) -> Void) {
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Error: No data received")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(ObjectType.self, from: data)
                completion(object)
            } catch {
                print("Error: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
    
    
}

//
//  ObjectURLSessionService.swift
//  quest1
//
//  Created by Gemma Emery on 02-03-2024.
//

import Foundation
import Alamofire

class ObjectAlamofireService: IObjectService {
    typealias ObjectType = FlightsData
    var baseUrl: URL
    init?(baseUrl: String) {
        guard let url = URL(string: baseUrl + "?api_key=YOUR-API-KEY") else {
            return nil
        }
        self.baseUrl = url
    }
    
    func fetchObjects(completion: @escaping (ObjectType?) -> Void) {
        let utilityQueue = DispatchQueue.global(qos: .utility)
        AF.request(baseUrl).responseDecodable(of: ObjectType.self, queue: utilityQueue) { response in
            debugPrint("Response: \(response)")
            switch response.result {
            case .success(let object):
                completion(object)
            case .failure(let error):
                print("Error fetching objects: \(error)")
                completion(nil)
            }
        }
    }
}

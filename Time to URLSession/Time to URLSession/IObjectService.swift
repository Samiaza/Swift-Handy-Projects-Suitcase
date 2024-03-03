//
//  IObjectService.swift
//  quest1
//
//  Created by Gemma Emery on 02-03-2024.
//

import Foundation

protocol IObjectService {
    associatedtype ObjectType
    var baseUrl: URL { get }
    func fetchObjects(completion: @escaping (ObjectType?) -> Void)
}

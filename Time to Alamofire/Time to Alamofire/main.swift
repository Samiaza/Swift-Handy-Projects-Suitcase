//
//  main.swift
//  Time to Alamofire
//
//  Created by Gemma Emery on 03-03-2024.
//

import Foundation

let semaphore = DispatchSemaphore(value: 0)

if let service = ObjectAlamofireService(baseUrl: "https://airlabs.co/api/v9/flights") {
    service.fetchObjects{ object in
        if let object = object {
            print("Fligths: \(object.fligths)")
            semaphore.signal()
        } else {
            print("Nothing")
            semaphore.signal()
        }
    }
    semaphore.wait()
} else {
    print("invalid url")
}

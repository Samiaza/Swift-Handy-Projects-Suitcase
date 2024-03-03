//
//  main.swift
//  Time to URLSession
//
//  Created by Gemma Emery on 03-03-2024.
//

import Foundation

let semaphore = DispatchSemaphore(value: 0)

let service = ObjectURLSessionService(baseUrl: "https://airlabs.co/api/v9/flights")

service?.fetchObjects(completion: { object in
    if let object = object {
        print("Fligths: \(object.fligths)")
        semaphore.signal()
    } else {
        print("Nothing")
        semaphore.signal()
    }
})

semaphore.wait()


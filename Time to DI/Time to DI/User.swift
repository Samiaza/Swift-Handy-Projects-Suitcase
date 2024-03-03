//
//  User.swift
//  quest3
//
//  Created by Gemma Emery on 03-03-2024.
//

import Foundation

class User {
    let name: String
    let surname: String
    var age: Int
    var phone: String
    init(_ name: String, _ surname: String, _ age: Int, _ phone: String) {
        self.name = name
        self.surname = surname
        self.age = age
        self.phone = phone
    }
}

protocol NetworkService: AnyObject {
    func getUsers() -> [User]
}

class NetworkServiceImpl: NetworkService {
    func getUsers() -> [User] {
        return [User("Aboba", "Simba", 18, "88005553535"),
                User("Zaboba", "Pimba", 28, "88005552727"),
                User("Buboba", "Limba", 38, "88005556060")]
    }
}

protocol DatabaseService: AnyObject {
    func saveUsers(users: [User]) -> Void
}

class ReleaseDatabaseServiceImpl: DatabaseService {
    func saveUsers(users: [User]) {
        print("Release: \(users.map { $0.name } as [AnyObject]) were saved.")
    }
}

class DebugDatabaseServiceImpl: DatabaseService {
    func saveUsers(users: [User]) {
        print("Debug: \(users.map { $0.name } as [AnyObject]) were saved.")
    }
}

class UserRepository : Equatable {
    let networkService: NetworkService
    let databaseService: DatabaseService
    init(_ networkService: NetworkService, _ databaseService: DatabaseService) {
        self.networkService = networkService
        self.databaseService = databaseService
    }
    
    func updateUsersData() {
        let users = networkService.getUsers()
        databaseService.saveUsers(users: users)
    }
    
    static func == (lhs: UserRepository, rhs: UserRepository) -> Bool {
        return lhs.databaseService === rhs.databaseService && lhs.networkService === rhs.networkService
    }
}


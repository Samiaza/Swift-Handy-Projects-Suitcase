//
//  main.swift
//  Time to DI
//
//  Created by Gemma Emery on 03-03-2024.
//

import Foundation
import Swinject

let container = Container()

container.register(NetworkService.self, factory: { _ in NetworkServiceImpl() })

container.register(DatabaseService.self, factory: { _ in ReleaseDatabaseServiceImpl() })

container.register(DatabaseService.self, name: "release", factory: { _ in ReleaseDatabaseServiceImpl() })
container.register(DatabaseService.self, name: "debug", factory: { _ in DebugDatabaseServiceImpl() })

container.register(UserRepository.self, name: "release", factory: { resolver in
    UserRepository(resolver.resolve(NetworkService.self)!, resolver.resolve(DatabaseService.self, name: "release")!) })

container.register(UserRepository.self, name: "debug", factory: { resolver in
    UserRepository(resolver.resolve(NetworkService.self)!, resolver.resolve(DatabaseService.self, name: "debug")!) })

let userRepositoryRelease = container.resolve(UserRepository.self, name: "release")!

let userRepositoryDebug = container.resolve(UserRepository.self, name: "debug")!

userRepositoryRelease.updateUsersData()

userRepositoryDebug.updateUsersData()

container.register(UserRepository.self, factory: { resolver in
    UserRepository(resolver.resolve(NetworkService.self)!, resolver.resolve(DatabaseService.self)!) }).inObjectScope(.container)

let userRepository = container.resolve(UserRepository.self)!

userRepository.updateUsersData()

let anotherUserRepository = container.resolve(UserRepository.self)!

print("Repositories are equal: " + (userRepository == anotherUserRepository).description)

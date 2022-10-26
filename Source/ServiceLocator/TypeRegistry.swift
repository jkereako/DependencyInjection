//
//  TypeRegistry.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

/// Dependency Injection registry
final class TypeRegistry {
    private var isLocked = false
    private var factories = [Int: Any]()

    func register(modules: RegistrationModuleType...) {
        modules.forEach {
            $0.register(registry: self)
        }
    }

    func register<T>(type aType: T.Type, resolver: @escaping () -> T) {
        precondition(!isLocked, "Registry is locked. Cannot register new types.")
        
        let typeHash = hash(type: aType)

        factories[typeHash] = resolver
    }

    func resolve<T>(type aType: T.Type) -> T {
        typealias ResolverType = () -> T
        let index = hash(type: aType.self)
        
        guard let resolverAny = factories[index] else {
            fatalError("Could not find a type registration for \(T.self)")
        }

        guard let resolver = resolverAny as? ResolverType else {
            fatalError(
                "Expected '\(type(of: ResolverType.self))' but got '\(type(of:resolverAny))'"
            )
        }

        isLocked = true
        return resolver()
    }
}

private extension TypeRegistry {
    func hash<T>(type aType: T.Type) -> Int {
        let s = "\(type(of: aType))"
        return s.hashValue
    }
}

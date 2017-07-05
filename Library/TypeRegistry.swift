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
    private var factories = FactoryDictionary()

    func register(modules: RegistrationModuleType...) {
        modules.forEach {
            $0.register(registry: self)
        }
    }

    func register<T>(type aType: T.Type, resolver: @escaping (Void) -> T) {
        let typeHash = hash(type: aType)

        factories[typeHash] = resolver
    }

    func resolve<T>(type aType: T.Type) -> T {
        typealias ResolverType = (Void) -> T

        guard let resolverAny = factories[hash(type: aType.self)] else {
            fatalError("Could not find a type registration for \(T.self)")
        }

        guard let resolver = resolverAny as? ResolverType else {
            fatalError(
                "Expected '\(type(of: ResolverType.self))' but got '\(type(of:resolverAny))'"
            )
        }

        return resolver()
    }
}

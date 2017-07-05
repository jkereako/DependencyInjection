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
    var container: TypeContainer {
        get {
            let container = TypeContainer(factories: factories)
            return container
        }
    }

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
}

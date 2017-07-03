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

    init() {
        register(type: Void.self) { _ in Void() }
    }

    func register(modules: RegistrationModuleType...) {
        modules.forEach {
            $0.register(registry: self)
        }
    }


    func register<T>(type ptype: T.Type, resolver: @escaping (TypeContainer) -> T) {
        let factory: (TypeContainer) -> T
        let typeHash = hash(type: ptype)
        var instance: T?

        factory = { container in
            if instance == nil {
                instance = resolver(container)
            }

            return instance!
        }

        // Store
        factories[typeHash] = factory
    }
}

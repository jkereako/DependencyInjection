//
//  TypeContainer.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

final class TypeContainer {
    private let factories: FactoryDictionary

    init(factories: FactoryDictionary) {
        self.factories = factories
    }

    func resolveType<T>() -> T {
        typealias ResolverType = (TypeContainer) -> T

        guard let resolverAny = factories[hash(type: T.self)] else {
            fatalError("Could not find a type registration for \(T.self)")
        }

        guard let resolver = resolverAny as? ResolverType else {
            fatalError("Resolver found, but not the expected type '\(type(of: ResolverType.self))'" +
                ".  Was: '\(type(of:resolverAny))'")
        }

        return resolver(self)
    }
}

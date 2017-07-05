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

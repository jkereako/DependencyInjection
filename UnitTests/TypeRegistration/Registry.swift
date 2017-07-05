//
//  Registry.swift
//  DependencyInjectionTests
//
//  Created by Jeff Kereakoglow on 7/3/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

@testable import DependencyInjection

/// The unit test type registry. Registers type mocks.
final class RegistryModule: RegistrationModuleType {
    func register(registry: TypeRegistry) {
        registry.register(type: GitHubAPIClientType.self) { GitHubAPITestClient() }
    }
}

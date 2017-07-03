//
//  Registry.swift
//  DependencyInjectionTests
//
//  Created by Jeff Kereakoglow on 7/3/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

@testable import DependencyInjection

final class RegistryModule: RegistrationModuleType {
    func register(registry: TypeRegistry) {
        registry.register(type: GitHubAPIClientType.self) { _ in return GitHubAPITestClient() }
    }
}

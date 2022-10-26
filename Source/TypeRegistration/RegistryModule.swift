//
//  RootRegistry.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

/// The type registry.
final class RegistryModule: RegistrationModuleType {
    func register(registry: TypeRegistry) {
        registry.register(type: GitHubAPIClientType.self) { GitHubAPIClient() }
    }
}

//
//  AppRegistry.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

private var appRegistry: TypeRegistry?

/// Top-level container for resolving registered types
var AppRegistry: TypeRegistry {
    get {
        guard let registry = appRegistry else {
            fatalError("AppContainer was not initialized.")
        }
        return registry
    }
}

func initializeAppContainer(withRegistrationModule module: RegistrationModuleType) {
    let registry = TypeRegistry()
    registry.register(modules: module)
    appRegistry = registry
}

#if DEBUG
/// Sets `appContainer` to nil. This is only intended to be used with unit tests.
func destroyAppRegistry() {
    appRegistry = nil
}
#endif

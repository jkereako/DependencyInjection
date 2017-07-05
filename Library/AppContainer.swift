//
//  AppContainer.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

private var appContainer: TypeContainer?

/// Top-level container for resolving registered types
var AppContainer: TypeContainer {
    get {
        guard let container = appContainer else {
            fatalError("AppContainer was not initialized.")
        }
        return container
    }
}

func initializeAppContainer(withRegistrationModule module: RegistrationModuleType) {
    let registry = TypeRegistry()
    registry.register(modules: module)
    initializeAppContainer(withContainer: registry.container)
}

func initializeAppContainer(withContainer container: TypeContainer) {
    guard appContainer == nil else {
        fatalError("AppContainer may only be set once.")
    }

    appContainer = container
}

#if DEBUG
/// Sets `appContainer` to nil. This is only intended to be used with unit tests.
func destroyAppContainer() {
    appContainer = nil
}
#endif

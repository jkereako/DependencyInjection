//
//  TypeRegistrationTestCase.swift
//  DependencyInjectionTests
//
//  Created by Jeff Kereakoglow on 7/3/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//


import XCTest
@testable import DependencyInjection

class TypeRegistrationTestCase: XCTestCase {
    override func setUp() {
        super.setUp()

        destroyAppRegistry()
        initializeAppContainer(with: RegistryModule())
    }
}

//
//  DependencyInjectionTests.swift
//  DependencyInjectionTests
//
//  Created by Jeff Kereakoglow on 5/7/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import XCTest
@testable import DependencyInjection

final class DependencyInjectionTests: TypeRegistrationTestCase  {
    private var apiClient: GitHubAPIClientType!

    override func setUp() {
        super.setUp()

        apiClient = AppContainer.resolveType()
    }

    func testTypeResolution() {
        XCTAssertTrue(apiClient is GitHubAPITestClient)
    }

    func testExample() {
        apiClient.zen { quote in
            XCTAssertEqual(quote, GitHubAPITestClient.stubText)
        }
    }
}

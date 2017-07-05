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

        apiClient = AppRegistry.resolve(type: GitHubAPIClientType.self)
    }

    func testTypeResolution() {
        XCTAssertTrue(apiClient is GitHubAPITestClient)
    }

    func testZenQuote() {
        apiClient.zen { quote in
            XCTAssertEqual(quote, GitHubAPITestClient.stubText)
        }
    }
}

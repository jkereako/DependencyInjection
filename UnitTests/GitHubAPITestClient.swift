//
//  GitHubAPITestClient.swift
//  DependencyInjectionTests
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

/// The mock API client. Returns canned responses.
final class GitHubAPITestClient: GitHubAPIClientType {
    static let stubText = "Tell me how am I supposed to live without you?"

    func zen(completion: @escaping (String) -> Void) {
        completion(GitHubAPITestClient.stubText)
    }
}

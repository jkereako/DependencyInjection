//
//  GitHubAPIClientType.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

/// Provides a generic interface for the GitHub API client. There are 2 implementations of this
/// protocol, GitHubAPIClient and GitHubTestAPIClient.
protocol GitHubAPIClientType {
    func zen(completion: @escaping (String) -> Void)
}

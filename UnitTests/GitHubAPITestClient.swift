//
//  GitHubAPITestClient.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

final class GitHubAPITestClient: GitHubAPIClientType {
    func zen(completion: @escaping (String) -> Void) {
        completion("Tell me how am I supposed to live without you?")
    }
}

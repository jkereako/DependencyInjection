//
//  GitHubAPIClient.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

/// The actual API client. Makes HTTP requests to `api.github.com/zen`.
final class GitHubAPIClient: GitHubAPIClientType {
    private let baseURL = URL(string: "https://api.github.com")!

    func zen(completion: @escaping (String) -> Void) {
        let url = baseURL.appendingPathComponent("zen")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // The completion handler for `dataTask` runs on a background thread. Since this URL
            // task will update the UI, we call the completion handler on the UI thread.
            DispatchQueue.main.async {
                completion(String(data: data!, encoding: .utf8) ?? "")
            }
        }

        task.resume()
    }
}

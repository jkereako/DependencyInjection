//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 5/7/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var quote: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let apiClient = AppContainer.resolve(type: GitHubAPIClientType.self)

        // Sanity check. Assert that we've registered the correct implementation of 
        // GitHubAPIClientType.
        assert(apiClient is GitHubAPIClient)

        apiClient.zen {
            self.quote.text = $0
        }

        quote.text = ""
    }
}


//
//  GitHubAPIClientType.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

protocol GitHubAPIClientType {
    func zen(completion: @escaping (String) -> Void)
}

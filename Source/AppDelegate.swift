//
//  AppDelegate.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 5/7/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        initializeAppContainer(withRegistrationModule: RegistryModule())

        return true
    }
}


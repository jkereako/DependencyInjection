//
//  Helpers.swift
//  DependencyInjection
//
//  Created by Jeff Kereakoglow on 7/2/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

func hash<T>(type aType: T.Type) -> Int {
    let s = "\(type(of:aType))"
    return s.hashValue
}

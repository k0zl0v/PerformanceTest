//
//  EnvironmentValues+SafeAreaInsets.swift
//  PerformanceTest
//
//  Created by akozlov on 01.07.2022.
//

import SwiftUI

// MARK: -
public extension EnvironmentValues {
    
    var safeAreaInsets: EdgeInsets {
        get { self[SafeAreaInsetsKey.self] }
        set { self[SafeAreaInsetsKey.self] = newValue }
    }
    
}

// MARK: -
struct SafeAreaInsetsKey: EnvironmentKey {
    
    static var defaultValue = EdgeInsets()
    
}

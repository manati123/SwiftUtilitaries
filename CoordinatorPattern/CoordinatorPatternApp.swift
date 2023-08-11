//
//  CoordinatorPatternApp.swift
//  CoordinatorPattern
//
//  Created by Preoteasa Ioan-Silviu on 09.08.2023.
//

import SwiftUI

@main
struct CoordinatorPatternApp: App {
    @StateObject var coordinator = NavigationPathContainer()
    
    var body: some Scene {
        WindowGroup {
            MainCoordinator()
                .environmentObject(coordinator)
        }
    }
}

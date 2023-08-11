//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Preoteasa Ioan-Silviu on 09.08.2023.
//

import SwiftUI

enum Sheet: String, CaseIterable, Identifiable {
    case popup
    
    var id: String {self.rawValue}
}

final class NavigationPathContainer: ObservableObject {
    @Published var path = NavigationPath()
}



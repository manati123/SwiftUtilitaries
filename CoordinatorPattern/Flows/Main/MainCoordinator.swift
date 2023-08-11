//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Preoteasa Ioan-Silviu on 09.08.2023.
//

import SwiftUI

enum MainCoordinatorState: Hashable {
    case home
    case productList([String])
}

enum MainCoordinatorSheet: String, Hashable, Identifiable {
    case sheet
    
    var id: String {
        return rawValue
    }
}

struct MainCoordinator: View {
    @EnvironmentObject var pathContainer: NavigationPathContainer
    @State var sheet: MainCoordinatorSheet?
    @State private var sheetHeight: CGFloat = .zero
    
    var body: some View {
        NavigationStack(path: $pathContainer.path) {
            getScreen(.home)
                .sheet(item: $sheet) { sheet in
                    SheetView()
                        .overlay {
                            GeometryReader { sheetProxy in
                                Color.clear.preference(key: InnerHeightPreferenceKey.self, value: sheetProxy.size.height)
                            }
                        }
                        .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                            sheetHeight = newHeight
                        }
                        .presentationDetents([.height(sheetHeight)])
                }
                .navigationDestination(for: MainCoordinatorState.self) { screen in
                    getScreen(screen)
                }
        }
    }
    
    @ViewBuilder
    func getScreen(_ state: MainCoordinatorState) -> some View {
        switch state {
        case .home:
            HomeView(productListHandle: { products in
                pathContainer.path.append(MainCoordinatorState.productList(products))
            }) {
                sheet = .sheet
            }
        case .productList(let list):
            ProductListCoordinator(productList: list)
            
        }
    }
}

struct InnerHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

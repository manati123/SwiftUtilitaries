//
//  ProductListCoordinator.swift
//  CoordinatorPattern
//
//  Created by Catalin Demian on 09.08.2023.
//

import SwiftUI

enum ProductListCoordinatorState: Hashable {
    case productList([String])
    case productDetails(String)
}

struct ProductListCoordinator: View {
    @EnvironmentObject var pathContainer: NavigationPathContainer
    @State var productList: [String]
    
    var body: some View {
        getScreen(.productList(productList))
            .navigationDestination(for: ProductListCoordinatorState.self) { state in
                getScreen(state)
            }
    }
    
    @ViewBuilder
    func getScreen(_ state: ProductListCoordinatorState) -> some View {
        switch state {
        case .productList(let list):
            ProductListView(productList: list) { selectedProduct in
                pathContainer.path.append(ProductListCoordinatorState.productDetails(selectedProduct))
            }
        case .productDetails(let product):
            ProductDetailView(currentProduct: product) {
                pathContainer.path.removeLast(pathContainer.path.count)
            }
        }
    }
}

//struct MainCoordinatorView_Previews: PreviewProvider {
//    @State static var coordinator = Coordinator()
//    static var previews: some View {
//        MainCoordinator()
//            .environmentObject(coordinator)
//    }
//}

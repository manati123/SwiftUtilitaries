//
//  ProductDetailView.swift
//  CoordinatorPattern
//
//  Created by Preoteasa Ioan-Silviu on 09.08.2023.
//

import SwiftUI

struct ProductDetailView: View {
    let currentProduct: String?
    let homeAction: () -> Void
    
    var body: some View {
        VStack {
            if let currentProduct {
                Text("Product is : \(currentProduct)")
            }
            Button {
                homeAction()
            } label: {
                Text("Go home")
            }
        }.navigationTitle("Product detail view")
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    @State static var coordinator = Coordinator()
//    static var previews: some View {
//        NavigationStack {
//            ProductDetailView()
//                .environmentObject(coordinator)
//        }
//    }
//}

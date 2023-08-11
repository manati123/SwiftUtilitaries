//
//  ProductListView.swift
//  CoordinatorPattern
//
//  Created by Preoteasa Ioan-Silviu on 09.08.2023.
//

import SwiftUI

struct ProductListView: View {
    var productList = ["iPhone", "iPad", "Apple Watch", "Macbook Pro"]
    var productInteractionHandle: (String) -> Void
    
    var body: some View {
        VStack {
            List(productList, id: \.self) { product in
                HStack {
                    Text(product)
                    Spacer()
                    Button {
                        productInteractionHandle(product)
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }.foregroundColor(.accentColor)
            }
        }
        .navigationTitle("Product list")
    }
}

//struct ProductListView_Previews: PreviewProvider {
//    @State static var coordinator = Coordinator()
//    static var previews: some View {
//        NavigationStack {
//            ProductListView()
//                .environmentObject(coordinator)
//        }
//    }
//}

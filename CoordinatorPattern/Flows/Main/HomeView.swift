//
//  ContentView.swift
//  CoordinatorPattern
//
//  Created by Preoteasa Ioan-Silviu on 09.08.2023.
//

import SwiftUI

struct HomeView: View {
    let productListHandle: ([String]) -> Void
    let sheetHandle: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                productListHandle(["iPhone", "iPad", "Macbook Pro"])
            } label: {
                Text("Go to product list")
            }
            Button {
                sheetHandle()
            } label: {
                Text("Open popup")
            }
        }
        .padding()
        .navigationTitle("Home page")
    }
}

//struct HomeView_Previews: PreviewProvider {
//    @State static var coordinator = Coordinator()
//    static var previews: some View {
//        NavigationStack {
//            HomeView()
//                .environmentObject(coordinator)
//        }
//    }
//}

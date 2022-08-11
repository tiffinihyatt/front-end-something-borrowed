//
//  ShoppingBagView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/3/22.
//

import SwiftUI

struct ShoppingBagView: View {
    
    @State private var itemsInBag = [Garment]()
    
    var body: some View {
        NavigationView {
            List(itemsInBag) { item in
                VStack(alignment: .leading) {
                    Text(garment.title)
                        .font(.headline)

                    Text("Size: \(garment.size)")
                    Text("Price: $\(garment.price)")
                }
            }
            .navigationTitle("Your Bag")
            .task {
                await getAllGarments()
            }
        }
    }
}

struct ShoppingBagView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingBagView()
    }
}

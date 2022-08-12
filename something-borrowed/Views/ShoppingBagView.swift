//
//  ShoppingBagView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/3/22.
//

import SwiftUI

struct ShoppingBagView: View {
    
    @State private var garmentManager = GarmentManager()
    @State private var garmentsInBag = [Garment]()
    
    var body: some View {
        NavigationView {
            List(garmentsInBag) { garment in
                VStack(alignment: .leading) {
                    Text(garment.title)
                        .font(.headline)
                    Text("Price: $\(garment.price)")
                }
            }
            .navigationTitle("Your Bag")
            .task {
                do {
                    garmentsInBag = try await garmentManager.getShoppingBag()
                } catch {
                    print("\(error)")
                }
                
            }
        }
    }
}

struct ShoppingBagView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingBagView()
    }
}

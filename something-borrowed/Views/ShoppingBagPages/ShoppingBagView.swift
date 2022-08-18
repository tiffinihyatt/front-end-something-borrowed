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
            VStack {
                List(garmentsInBag) { garment in
                    ShoppingBagDetailView(garment: garment)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(garment.title)
                                .font(.headline)
                            Text("Price: $\(garment.price)")
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            Task {
                                do {
                                    try await garmentManager.addToCart(garmentId: garment.id)
                                    garmentsInBag = try await garmentManager.getShoppingBag()
                                } catch {
                                    print("\(error)")
                                }
                            }
                        }) {
                            Image(systemName: "trash.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("darkPeach"))
                        }
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
                
                Button {
                    Task {
                        print("You clicked the check out button.")
                    }
                } label: {
                    Text("CHECK OUT")
                        .foregroundColor(.white)
                        .font(.custom("Avenir-Medium", size: 21))
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color("darkTeal"))
                        .frame(width: 300)
                )
            }
        }
    }
}

//struct ShoppingBagView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingBagView()
//    }
//}

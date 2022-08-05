//
//  BrowseView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/2/22.
//

import SwiftUI

struct BrowseView: View {
    @State private var garments = [Garment]()
    
    var body: some View {
        NavigationView {
            List(garments) { garment in
                VStack(alignment: .leading) {
                    Text(garment.title)
                        .font(.headline)

                    Text("Size: \(garment.size)")
                    Text("Price: $\(garment.price)")
                }
            }
            .navigationTitle("Browse")
            .task {
                await getAllGarments()
            }
        }
    }
    
    func getAllGarments() async {
        do {
            let url = URL(string: "http://127.0.0.1:5000/garments")!
            let (data, _) = try await URLSession.shared.data(from: url)
            garments = try JSONDecoder().decode([Garment].self, from: data)
        } catch {
            garments = [
                Garment(
                    id: 0,
                    title: "Oops! No garments to show.",
                    brand: "--",
                    size: 0,
                    color: "--",
                    condition: "--",
                    price: "--",
                    description: "--",
                    is_available: false
                    )
            ]
        }
    }
}
struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

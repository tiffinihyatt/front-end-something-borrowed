//
//  BrowseView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/2/22.
//

import SwiftUI

struct BrowseView: View {
    @State private var garments = [Garment]()
    @State private var isGarmentSelected: Bool = false
    @State var selectedGarment: Garment?
    
    var body: some View {
        if !isGarmentSelected {
            NavigationView {
                List(garments) { garment in
                    Button {
                        print("You selected \(garment.title)")
                        isGarmentSelected = true
                        selectedGarment = garment
                    } label: {
                        VStack(alignment: .leading) {
                            Text(garment.title)
                                .font(.headline)

                            Text("Size: \(garment.size)")
                            Text("Price: $\(garment.price)")
                        }
                    }
                }
                .navigationTitle("Browse")
                .task {
                    await getAllGarments()
                }
            }
        } else {
            NavigationView {
                VStack(alignment: .leading) {
                    Text(selectedGarment?.title ?? "Oops! Looks like that garment is unavailable.")
                        .font(.headline)
                    Text("$\(selectedGarment!.price)")
                        .bold()
                    Text("")
                    Text("Brand: \(selectedGarment!.brand)")
                    Text("Size: \(String(selectedGarment!.size))")
                    Text("Condition: \(selectedGarment!.condition)")
                    Text("")
                    Text("Description")
                        .italic()
                    Text(selectedGarment!.description)
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle(selectedGarment!.title)
        }
//        if not selectedGarment: display all garments
//        else, call getSingleGarment and display alternative view
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

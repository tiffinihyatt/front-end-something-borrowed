//
//  BrowseView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/2/22.
//

import SwiftUI
import Amplify

struct BrowseView: View {
    @State private var garmentManager = GarmentManager()
    @State private var imageManager = ImageManager()
    
    @State private var garments = [Garment]()
    @State private var isGarmentSelected: Bool = false
    @State var selectedGarment: Garment?
    
    var body: some View {
        if !isGarmentSelected {
            NavigationView {
                List(garments) { garment in
//                    var newGarment = displayGarment(brand: garment.brand, color: garment.color, condition: garment.condition, description: garment.description, id: garment.id, price: garment.price, size: garment.size, title: garment.title, image: UIImage(systemName: "noGarmentImage")!)
//                    let garmentCompletion = { image in
//                        newGarment.image = image
//                    }
//                    imageManager.downloadImage(garment: newGarment)
//                    var _: Void = imageManager.downloadImage(garment: newGarment)
                    
                    Button {
                        print("You selected \(garment.title)")
                        isGarmentSelected = true
                        selectedGarment = garment
                    } label: {
                        BrowseGarmentView(garment: garment)
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
                    
                    Button("ADD TO BAG") {
                        Task {
                            do {
                                try await garmentManager.addToCart(garmentId: selectedGarment!.id)
                                isGarmentSelected = false
                            } catch {
                                print("\(error)")
                            }
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.pink)
                    )
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
                    brand: "--",
                    color: "--",
                    condition: "--",
                    description: "--",
                    id: 0,
                    is_available: true,
                    price: "--",
                    size: 40,
                    title: "Oops! No garments to show. Check back later!"
                    )
            ]
        }
    }
    
    func resolveGarmentImages() async {
        do {
            
        }
    }
}
struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

//
//  SingleGarmentView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/11/22.
//

import SwiftUI
import UIKit


struct SingleGarmentView: View {
    
    var garmentManager = GarmentManager()
    @State var garment: SingleGarmentResponseBody?
    
    var body: some View {
        VStack {
            
        }
    }
    
    
    
    
    
    
    
//    @State private var garments = [Garment]()
//
//    var body: some View {
//        NavigationView {
//            List(garments) { garment in
//                VStack(alignment: .leading) {
//                    Text(garment.title)
//                        .font(.headline)
//
//                    Text("Size: \(garment.size)")
//                    Text("Price: $\(garment.price)")
//                }
//            }
//            .navigationTitle(garments[0].title)
//            .task {
//                await getOneGarment(garment_id: garments[0].id)
//            }
//        }
//    }
    
//    func getOneGarment(garment_id: Int) async {
//        do {
//            let url = URL(string: "http://127.0.0.1:5000/garments/\(garment_id)")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            garments = try JSONDecoder().decode([Garment].self, from: data)
//        } catch {
//            fatalError("Error retrieving garment")
//        }
//    }
}

struct SingleGarmentView_Previews: PreviewProvider {
    static var previews: some View {
        SingleGarmentView()
    }
}


//func getAllGarments() async {
//    do {
//        let url = URL(string: "http://127.0.0.1:5000/garments")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//        garments = try JSONDecoder().decode([Garment].self, from: data)
//    } catch {
//        garments = [
//            Garment(
//                id: 0,
//                title: "Oops! No garments to show.",
//                brand: "--",
//                size: 0,
//                color: "--",
//                condition: "--",
//                price: "--",
//                description: "--",
//                is_available: false
//                )
//        ]
//    }
//}

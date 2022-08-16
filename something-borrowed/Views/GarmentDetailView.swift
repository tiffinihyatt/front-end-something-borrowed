//
//  GarmentDetailView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/15/22.
//

import SwiftUI

struct GarmentDetailView: View {
    var garment: Garment
    @State var image: UIImage = UIImage(named: "noGarmentImage")!
    var imageManager = ImageManager()
    
    var body: some View {
        VStack(alignment: .center) {
            
            Image(uiImage: image)
                .resizable()
                .frame(width: 210, height: 210, alignment: .center)
                .clipShape(Rectangle())
            
            Text(garment.title)
                .font(.headline)
            Text("$\(garment.price)")
                .bold()
            Text("")
            Text("Brand: \(garment.brand)")
            Text("Size: \(String(garment.size))")
            Text("Condition: \(garment.condition)")
            Text("")
            Text("Description")
                .italic()
            Text(garment.description)
        }
        .task {
            updateImage()
        }
    }
    
    func updateImage() {
        imageManager.downloadImage(garmentId: garment.id) { newImage in
            if let newImage = newImage {
                image = newImage
            }
        }
    }
}

//struct GarmentDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        GarmentDetailView()
//    }
//}

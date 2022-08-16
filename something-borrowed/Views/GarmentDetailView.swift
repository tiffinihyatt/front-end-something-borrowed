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
                .frame(width: 300, height: 300, alignment: .center)
                .clipShape(Rectangle())
            
            Text(garment.title)
                .font(.custom("Avenir-Medium", size: 24))
            Text("$\(garment.price)")
                .font(.custom("Avenir-Medium", size: 24))
            Group {
                Text("")
                Text(garment.brand)
                Text("Size \(String(garment.size))")
                Text(garment.condition)
                Text("")
                Text(garment.description)
                    .italic()
            }
            .font(.custom("Avenir-Medium", size: 18))
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

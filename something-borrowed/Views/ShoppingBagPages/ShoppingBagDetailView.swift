//
//  ShoppingBagDetailView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/15/22.
//

import SwiftUI

struct ShoppingBagDetailView: View {
    var garment: Garment
    @State var image: UIImage = UIImage(named: "noGarmentImage")!
    var imageManager = ImageManager()
    
    var body: some View {
        HStack {
            Spacer()
            Image(uiImage: image)
                .resizable()
                .frame(width: 210, height: 210, alignment: .center)
                .clipShape(Rectangle())
            Spacer()
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

//struct ShoppingBagDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingBagDetailView()
//    }
//}

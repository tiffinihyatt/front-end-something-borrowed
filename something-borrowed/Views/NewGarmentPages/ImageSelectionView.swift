//
//  ImageSelectionView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/14/22.
//

import SwiftUI

struct ImageSelectionView: View {
    
    @State private var changeGarmentImage = false
    @State private var openCameraRoll = false
    @State private var selectedImage = UIImage()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Button(action: {
                changeGarmentImage = true
                openCameraRoll = true
                
            }, label: {
                if changeGarmentImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .frame(width: 210, height: 210, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                } else {
                    Image("addListingImage")
                        .resizable()
                        .frame(width: 210, height: 210, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
        })
            Image(systemName: "plus")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(.gray)
                .clipShape(Circle())
        }
        .sheet(isPresented: $openCameraRoll) {
            ImagePicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
        }
    }
}

struct ImageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionView()
    }
}

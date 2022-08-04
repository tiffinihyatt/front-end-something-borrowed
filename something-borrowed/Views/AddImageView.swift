//
//  AddImageView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/3/22.
//

import SwiftUI

struct AddImageView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.secondary)
                
                HStack {
                    Image(systemName: "photo.on.rectangle.angled")
                        .foregroundColor(.white)
                    Text("Tap to add a photo!")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                
                image?
                    .resizable()
                    .scaledToFit()
            }
            .onTapGesture {
                showingImagePicker = true
            }
            .padding(20)
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            
            NewGarmentView()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}

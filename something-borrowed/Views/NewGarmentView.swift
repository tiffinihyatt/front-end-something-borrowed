//
//  NewGarmentView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/2/22.
//

import SwiftUI

struct NewGarmentView: View {
    @State private var garmentManager = GarmentManager()
//    @State private var imageManager = ImageManager()
    
//    state vars for new garment
    @State private var newGarment: Garment?
    @State private var title: String = ""
    @State private var brand: String = ""
    @State private var size: Int = 0
    @State private var color: String = ""
    @State private var condition: String = ""
    @State private var price: String = ""
    @State private var description: String = ""
    
//    state vars for adding image
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
//    data for picker selections
    private var sizes = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
    private var colors = [
        "Black",
        "Blue",
        "Brown",
        "Gold",
        "Green",
        "Grey",
        "Ivory",
        "Multicolored",
        "Orange",
        "Other",
        "Pink",
        "Purple",
        "Red",
        "Silver",
        "White",
        "Yellow"
    ]
    private var brands = [
        "Atelier Mon",
        "BHLDN",
        "BEC + BRIDGE",
        "Christian Siriano",
        "Halston",
        "Jenny Yoo",
        "Leanne Marshall",
        "Monique Lhuillier",
        "Pantora Bridal",
        "Reem Acra",
        "Ronny Kobo",
        "Watters",
    ]
    
    var incompleteForm: Bool {
        self.title.isEmpty || self.brand.isEmpty || self.color.isEmpty || self.condition.isEmpty || self.price.isEmpty || self.description.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
//                ZStack {
//                    Rectangle()
//                        .fill(.secondary)
//                        .frame(width: 300, height: 200)
//
//                    HStack {
//                        Image(systemName: "photo.on.rectangle.angled")
//                            .foregroundColor(.white)
//                        Text("Tap to add a photo!")
//                            .foregroundColor(.white)
//                            .font(.headline)
//                    }
//
//                    image?
//                        .resizable()
//                        .scaledToFit()
//                }
//                .onTapGesture {
//                    showingImagePicker = true
//                }
//                .padding(10)
//                .onChange(of: inputImage) { _ in loadImage() }
//                .sheet(isPresented: $showingImagePicker) {
//                    ImagePicker(image: $inputImage)
//                }
                
                Form {
                    TextField("Item Name", text: $title)

                    Picker("Brand", selection: $brand) {
                        ForEach(brands, id: \.self) {brand in
                            Text(brand)
                        }
                    }
                    
                    Picker("Color", selection: $color) {
                        ForEach(colors, id: \.self) {color in
                            Text(color)
                        }
                    }
                    
                    Picker("Condition", selection: $condition) {
                        Text("New with tags").tag("New with tags")
                        Text("Excellent used condition").tag("Excellent used condition")
                        Text("Good used condition").tag("Good used condition")
                        Text("Fair used condition").tag("Fair used condition")
                    }
                    
                    Picker("Size", selection: $size) {
                        ForEach(sizes, id: \.self) {size in
                            Text(String(size))
                        }
                    }
                    
                    Section("Item Description") {
                        TextField("Tell us about your item!", text: $description)
                    }
                    
                    Section("Price") {
                        TextField("Price", text: $price)
                    }
                    
                    Button("List your item!") {
                        Task {
                            try await newGarment = garmentManager.addNewGarment(title: title, brand: brand, size: size, color: color, condition: condition, price: price, description: description)
//                            imageManager.uploadImage(image: inputImage!, imageKey: newGarment!.id)
                        }
                    }
//                    Add secondary API call to post garment image
                    .disabled(incompleteForm)
                }
            }
        
            .navigationTitle("List an Item")
        }
    }
    
//    func postGarmentWithImage() async {
//        let garmentId: () = await garmentManager.postNewGarment(title: title, brand: brand, size: size, color: color, condition: condition, price: price, description: description)
//        let response = await garmentManager.postNewImage(garment_id: garmentId, image: image)
//    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct NewGarmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewGarmentView()
    }
}

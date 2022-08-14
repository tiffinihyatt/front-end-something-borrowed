//
//  NewGarmentView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/2/22.
//

import SwiftUI

struct NewGarmentView: View {
    @State private var garmentManager = GarmentManager()
    
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
    @State private var changeGarmentImage = false
    @State private var openCameraRoll = false
    @State private var selectedImage = UIImage()
    
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
        
            .navigationTitle("List an Item")
        }
    }
    
//    func postGarmentWithImage() async {
//        let garmentId: () = await garmentManager.postNewGarment(title: title, brand: brand, size: size, color: color, condition: condition, price: price, description: description)
//        let response = await garmentManager.postNewImage(garment_id: garmentId, image: image)
//    }
}

struct NewGarmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewGarmentView()
    }
}

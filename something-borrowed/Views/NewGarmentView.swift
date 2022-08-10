//
//  NewGarmentView.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/2/22.
//

import SwiftUI

struct NewGarmentView: View {
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
    
    let sizes = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
    
//    var garmentManager = GarmentManager()
    
    var incompleteForm: Bool {
        self.title.isEmpty || self.brand.isEmpty || self.color.isEmpty || self.condition.isEmpty || self.price.isEmpty || self.description.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
//                AddImageView()
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                        .frame(width: 300, height: 200)
                    
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
                .padding(10)
                .onChange(of: inputImage) { _ in loadImage() }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $inputImage)
                }
                
                Form {
                    TextField("Item Name", text: $title)

                    Picker("Brand", selection: $brand) {
                        Text("BHLDN").tag("BHLDN")
                        Text("Leanne Marshall").tag("Leanne Marshall")
                        Text("Pantora Bridal").tag("Pantora Bridal")
                    }
                    
                    Picker("Color", selection: $color) {
                        Text("Black").tag("Black")
                        Text("Ivory").tag("Ivory")
                        Text("White").tag("White")
                    }
                    
                    Picker("Condition", selection: $condition) {
                        Text("New with tags").tag("New with tags")
                        Text("Excellent used condition").tag("Excellent used condition")
                        Text("Good used condition").tag("Good used condition")
                        Text("Fair used condition").tag("Fair used condition")
                    }
                    
                    Picker("Size", selection: $size) {
                        Text("40").tag(40)
                        Text("38").tag(38)
                        Text("36").tag(36)
                    }
                    
                    Section("Item Description") {
                        TextField("Tell us about your item!", text: $description)
                    }
                    
                    Section("Price") {
                        TextField("Price", text: $price)
                    }
                    
                    Button("List your item!") {
                      postNewGarment(title: title, brand: brand, size: size, color: color, condition: condition, price: price, description: description)
                    }
//                    Add secondary API call to post garment image
                    .disabled(incompleteForm)
                }
            }
        
            .navigationTitle("List an Item")
        }
    }
    
    func postNewGarment(title: String, brand: String, size: Int, color: String, condition: String, price: String, description: String) {
        guard let url = URL(string: "http://127.0.0.1:5000/garments") else {
            print("Error: missing URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody: [String: AnyHashable] = [
            "title": title,
            "brand": brand,
            "size": size,
            "color": color,
            "condition": condition,
            "price": price,
            "description": description
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("Success! \(response)")
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
        
    }
    
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

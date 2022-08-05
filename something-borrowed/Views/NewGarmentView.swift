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
    
    let sizes = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
    
//    var garmentManager = GarmentManager()
    
    var body: some View {
        NavigationView {
            Form {
//                AddImageView()
                
                TextField("Item Name", text: $title)

                Picker("Brand", selection: $brand) {
                    Text("BHLDN").tag(0)
                    Text("Leanne Marshall").tag(1)
                    Text("Pantora Bridal").tag(2)
                }
//                .pickerStyle(WheelPickerStyle())
                
                Picker("Color", selection: $color) {
                    Text("Black").tag(0)
                    Text("Ivory").tag(1)
                    Text("White").tag(2)
                }
//                .pickerStyle(WheelPickerStyle())
                
                Picker("Condition", selection: $condition) {
                    Text("New with tags").tag(0)
                    Text("Excellent used condition").tag(1)
                    Text("Good used condition").tag(2)
                    Text("Fair used condition").tag(3)
                }
//                .pickerStyle(WheelPickerStyle())
                
                Picker("Size", selection: $size) {
                    Text("40").tag(0)
                    Text("38").tag(1)
                    Text("36").tag(2)
                }
//                .pickerStyle(WheelPickerStyle())
                
                Section("Item Description") {
                    TextField("Tell us about your item!", text: $description)
                }
                
                Section("Price") {
                    TextField("Price", text: $price)
                }
                
//                Button {garmentManager.postNewGarment(title: title, brand: brand, size: size, color: color, condition: condition, price: price, description: description)
//                } label: {
//                    Text("List your item!")
//                }
            }
        }
    }
}

struct NewGarmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewGarmentView()
    }
}

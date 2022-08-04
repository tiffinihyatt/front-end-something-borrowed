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
    @State private var streetSize: Int = 0
    @State private var labelSize: Int = 0
    @State private var color: String = ""
    @State private var condition: String = ""
    @State private var price: Int = 0
    @State private var description: String = ""
    
    let sizes = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
    
    var body: some View {
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        VStack {
            Form {
                Section("Basic Information") {
                    TextField("Item Name", text: $title)
                    TextField("Brand", text: $brand)
                    TextField("Color", text: $color)
                    TextField("Condition", text: $condition)
                }
                
                Section("Sizing") {
                    Picker("Street Size", selection: $streetSize) {
                        Text("0").tag(0)
                        Text("2").tag(2)
                        Text("4").tag(4)
                    }
                    
                    Picker("Label Size", selection: $labelSize) {
                        Text("0").tag(0)
                        Text("2").tag(2)
                        Text("4").tag(4)
                    }
                }
                
                Section("Item Description") {
                    TextField("Description", text: $description)
                }
            }
        }
    }
}

struct NewGarmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewGarmentView()
    }
}

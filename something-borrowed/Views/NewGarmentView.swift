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
//    street size
//    label size
    @State private var color: String = ""
    @State private var condition: String = ""
//    price
    @State private var description: String = ""
    
    var body: some View {
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        VStack {
            List {
                TextField("Item Name", text: $title)
                TextField("Brand", text: $brand)
                TextField("Color", text: $color)
                TextField("Condition", text: $condition)
                TextField("Description", text: $description)
            }
        }
    }
}

struct NewGarmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewGarmentView()
    }
}

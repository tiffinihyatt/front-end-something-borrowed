//
//  GarmentImage.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/15/22.
//

import Foundation
import SwiftUI

class displayGarment {
    
    init(brand: String, color: String, condition: String, description: String, id: Int, price: String, size: Int, title: String, image: UIImage) {
        
        self.brand = brand
        self.color = color
        self.condition = condition
        self.description = description
        self.id = id
        self.price = price
        self.size = size
        self.title = title
        self.image = image
    }
    
    var brand: String
    var color: String
    var condition: String
    var description: String
    var id: Int
    var price: String
    var size: Int
    var title: String
    var image: UIImage
}

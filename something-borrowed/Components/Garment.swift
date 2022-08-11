//
//  Garment.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/2/22.
//

import Foundation
import SwiftUI

struct Garment: Identifiable, Decodable {
    var brand: String
    var color: String
    var condition: String
    var description: String
    var id: Int
    var image_file: String
    var is_available: Bool
    var price: String
    var size: Int
    var title: String
}

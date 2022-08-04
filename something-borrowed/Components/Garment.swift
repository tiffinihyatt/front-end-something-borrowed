//
//  Garment.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/2/22.
//

import Foundation
import SwiftUI

struct Garment: Codable {
    var id: Int
    var title: String
    var brand: String
    var street_size: Int
    var label_size: Int
    var color: String
    var condition: String
    var price: Int
    var description: String
    var is_available: Bool
}

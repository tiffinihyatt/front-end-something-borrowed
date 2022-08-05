//
//  GarmentManager.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/4/22.
//

import SwiftUI
import Foundation

class GarmentManager {
    func postNewGarment(title: String, brand: String, size: Int, color: String, condition: String, price: String, description: String) async throws -> NewGarmentResponseBody {
        guard let url = URL(string: "http://127.0.0.1:5000/garments") else {
            fatalError("Missing or incorrect URL")
        }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "title": title,
            "brand": brand,
            "size": size,
            "color": color,
            "condition": condition,
            "price": price,
            "description": description
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?
            .statusCode == 201 else {
            fatalError("Error posting new garment.")
        }
        
        let decodedData = try JSONDecoder()
            .decode(NewGarmentResponseBody.self, from: data)
        return decodedData
    }
}

struct NewGarmentResponseBody: Decodable {
    var title: String
    var brand: String
    var size: Int
    var color: String
    var condition: String
    var price: String
    var description: String
}

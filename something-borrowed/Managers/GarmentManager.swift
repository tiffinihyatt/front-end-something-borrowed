//
//  GarmentManager.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/4/22.
//

import SwiftUI
import Foundation

class GarmentManager {
//    get single garment
    func getSingleGarment(garmentId: Int) async throws -> Garment {
        guard let url = URL(string: "https://backend-something-borrowed.herokuapp.com/garments/\(garmentId)") else {
            fatalError("Missing or incorrect URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error retrieving garment")
        }
        
        let decodedData = try JSONDecoder().decode(Garment.self, from: data)
        
        return decodedData
    }
    
//    get garments in shopping bag
    func getShoppingBag() async throws -> [Garment] {
        guard let url = URL(string: "https://backend-something-borrowed.herokuapp.com/garments/bag") else {
            fatalError("Missing or incorrect URL")
        }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error retrieving shopping bag")
        }

        let decodedData = try JSONDecoder().decode([Garment].self, from: data)

        return decodedData
    }
    
    
//    create new garment
    func addNewGarment(title: String, brand: String, size: Int, color: String, condition: String, price: String, description: String) async throws -> Garment {
        let body: [String: Any] = [
            "title": title,
            "brand": brand,
            "size": size,
            "color": color,
            "condition": condition,
            "price": price,
            "description": description
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        guard let url = URL(string: "https://backend-something-borrowed.herokuapp.com/garments") else {
            fatalError("Missing or incorrect URL")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error posting new garment")
        }
        
        let decodedData = try JSONDecoder().decode(Garment.self, from: data)
        
        return decodedData
    }
    
//    add garment to cart
    func addToCart(garmentId: Int) async throws {
        guard let url = URL(string: "https://backend-something-borrowed.herokuapp.com/garments/\(garmentId)") else {
            fatalError("Missing or incorrect URL")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PATCH"
        
        let (_, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error adding item to cart")
        }
    }
}

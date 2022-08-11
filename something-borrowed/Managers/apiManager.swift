//
//  GarmentManager.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/4/22.
//

import SwiftUI
import Foundation

class apiManager {
    
    func addNewGarment(title: String, brand: String, size: Int, color: String, condition: String, price: String, description: String) async throws {
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
        
        guard let url = URL(string: "http://127.0.0.1:5000/garments") else {
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
    }
    
    func addGarmentImage(garment_id: Int, imageFile: UIImage) async throws {
        let body: [String: Any] = [
            "file": imageFile
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        guard let url = URL(string: "http://127.0.0.1:5000/garments/\(garment_id)/upload") else {
            fatalError("Missing or incorrect URL")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error uploading garment image")
        }
    }
    
}
    
//    func postNewImage(garment_id: String, image: String) {
//        guard let url = URL(string: "http://127.0.0.1:5000/garments/\(garment_id)/upload") else {
//            print("Error: missing URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let requestBody: [String: AnyHashable] = [
//            "files": image
//        ]
//
//        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: .fragmentsAllowed)
//
//        let task = URLSession.shared.dataTask(with: request) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print("Success! \(response)")
//            }
//            catch {
//                print(error)
//            }
//        }
//
//        task.resume()
//    }

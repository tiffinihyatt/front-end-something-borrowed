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
    

//*******hacking with swift method*******

//func postNewGarment(title: String, brand: String, size: Int, color: String, condition: String, price: String, description: String) async -> String {
//    guard let url = URL(string: "http://127.0.0.1:5000/garments") else {
//        fatalError("Missing or incorrect URL")
//    }
//
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    let requestBody: [String: AnyHashable] = [
//        "title": title,
//        "brand": brand,
//        "size": size,
//        "color": color,
//        "condition": condition,
//        "price": price,
//        "description": description
//    ]
//
//    request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: .fragmentsAllowed)
//
//    let task = URLSession.shared.dataTask(with: request) { data, _, error in
//        guard let data = data, error == nil else {
//            return
//        }
//
//        do {
//            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//            print("Success! \(response)")
//        }
//        catch {
//            print(error)
//        }
//    }
//
//    task.resume()
//
//}

//******* lindsey's version *************
//    func postNewGarment(title: String, brand: String, size: Int, color: String, condition: String, price: String, description: String) async -> NewGarmentResponseBody {
//        guard let url = URL(string: "http://127.0.0.1:5000/garments") else {
//            fatalError("Missing or incorrect URL")
//        }
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let body: [String: AnyHashable] = [
//            "title": title,
//            "brand": brand,
//            "size": size,
//            "color": color,
//            "condition": condition,
//            "price": price,
//            "description": description
//        ]
//
//        let jsonData = try? JSONSerialization.data(withJSONObject: body)
//        request.httpBody = jsonData
//
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        guard (response as? HTTPURLResponse)?
//            .statusCode == 201 else {
//            fatalError("Error posting new garment.")
//        }
//
//        let decodedData = try JSONDecoder()
//            .decode(NewGarmentResponseBody.self, from: data)
//        return decodedData
//    }
//}
//
//
//struct NewGarmentResponseBody: Decodable {
//    var id: Int
//    var title: String
//    var brand: String
//    var size: Int
//    var color: String
//    var condition: String
//    var price: String
//    var description: String
//}
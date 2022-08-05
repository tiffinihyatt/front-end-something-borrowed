//
//  Network.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/5/22.
//

import Foundation

//func getAllGarments() async throws {
//    guard let url = URL(string: "http://127.0.0.1:5000/garments") else { fatalError("Missing URL") }
//        let urlRequest = URLRequest(url: url)
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
//        let decodedGarment = try JSONDecoder().decode(Garment.self, from: data)
//
//        print("Async decoded Garment", decodedGarment)
//}

//
//  ImageManager.swift
//  something-borrowed
//
//  Created by Tiffini Hyatt on 8/14/22.
//

import Foundation
import Amplify
import SwiftUI

class ImageManager {
    
    func uploadImage(image: UIImage, imageKey: Int) {
        let imageData = image.jpegData(compressionQuality: 1)!
        let stringImageKey = String(imageKey)
        
        Amplify.Storage.uploadData(key: stringImageKey, data: imageData) { result in
            switch result {
            case .success(let uploadedData):
                print(uploadedData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func downloadImage(imageKey: Int) -> UIImage {
        let stringImageKey = String(imageKey)
        var image = UIImage()

        Amplify.Storage.downloadData(key: stringImageKey) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    image = UIImage(data: data)!
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return image
    }
}

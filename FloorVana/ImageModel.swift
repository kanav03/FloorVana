//
//  ImageModel.swift
//  imageCapture
//
//  Created by Navdeep    on 14/11/24.
//

import UIKit

struct ImageModel {
    var imageData: Data // Stores image data
    var date: Date      // Stores the date the image was captured or uploaded

    // Static array to hold all saved images
    static var allImages = [ImageModel]()

    // Method to save an image to the data model
    static func saveImage(_ image: UIImage) {
        // Convert UIImage to Data
        if let data = image.jpegData(compressionQuality: 1.0) {
            let newImage = ImageModel(imageData: data, date: Date())
            allImages.append(newImage) // Add the new image to the array
        }
    }

    // Method to retrieve all saved images as an array of UIImage
    static func getAllImages() -> [UIImage] {
        return allImages.compactMap { UIImage(data: $0.imageData) }
    }
}

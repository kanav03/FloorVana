//
//  ImageDataModel.swift
//  FloorVana
//
//  Created by Navdeep    on 13/11/24.
//

// ImageDataModel.swift

import UIKit

struct Display3dDataModel {
    let image3DName: String
    let image2DName: String

    static func fetchImageData() -> Display3dDataModel {
        // Set the names of the images stored in the Assets
        return Display3dDataModel(image3DName: "a", image2DName: "floorplan")
    }
}

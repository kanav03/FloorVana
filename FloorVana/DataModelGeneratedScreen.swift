//
//  DataModelMyProject.swift
//  AppStore
//
//  Created by Navdeep    on 01/11/24.
//
class DataModelGeneratedScreen{
    private var photos = [
        ("myProject1"),
        ("myProject2"),
        ("myProject3"),
        ("myProject4"),
        ("myProject5"),
        ("myProject6"),
        
    ]
    
   
    func getPhotos() -> [String] {
        return photos
    }
    
   
    func getPhoto(at index: Int) -> String {
        return photos[index]
    }
}


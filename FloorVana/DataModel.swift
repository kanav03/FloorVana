//
//  DataModel.swift
//  AppStore
//
//  Created by Navdeep

import UIKit

struct App {
    var title: String
    var subtitle: String
    var id = UUID()
    var image: String
}


class DataModel {
    
    static var sections: [Section] = [.crousel3d,.button,.trending2D]
    
    static var apps: [App] = [
        App(title: "Explore 3D Designs", subtitle: "3BHK", image: "a"),
        App(title: "Explore 3D Designs", subtitle: "2BHK",image: "b"),
        App(title: "Explore 3D Designs", subtitle: "2BHK", image: "c"),
        App(title: "Explore 3D Designs", subtitle: "2BHK", image: "d"),
    ]
    
    static var standardApps: [App] = [
        App(title: "2D floor Plans", subtitle: "", image: "a1"),
        App(title: "2D floor Plans", subtitle: "",image: "a2"),
        App(title: "2D floor Plans", subtitle: "", image: "a3"),
        App(title: "2D floor Plans", subtitle: "", image: "a4"),
    ]
    
    static var label2D: [App] = [
        App(title: "Testimonials", subtitle: "", image: ""),
        
    ]
}





enum Section{
    case crousel3d
    case trending2D
    case button
}

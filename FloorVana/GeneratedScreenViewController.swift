//
//  GeneratedScreenViewController.swift
//  AppStore
//
//  Created by Rudra Pruthi on 02/11/24.
//

import UIKit

class GeneratedScreenViewController: UIViewController {
    
    @IBOutlet weak var GeneratedImage: UIImageView!
    
    
    @IBAction func saveButton(_ sender: UIButton) {
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GeneratedImage.image = UIImage(named: "floorplan2")
        GeneratedImage.layer.cornerRadius=15
        
        
        
    }


}

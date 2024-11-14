//
//  Display3DViewController.swift
//  FloorVana
//
//  Created by Navdeep    on 13/11/24.
//

import UIKit

class Display3DViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

       // Create a property to store the image data model
       private var imageDataModel: Display3dDataModel!

       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Fetch image data from the model
           imageDataModel = Display3dDataModel.fetchImageData()
           
           // Set initial image to 3D
           imageView.image = UIImage(named: imageDataModel.image3DName)
           
           // Add target for segmented control changes
           segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
       }

       @objc func segmentChanged() {
           // Update image based on selected segment
           switch segmentedControl.selectedSegmentIndex {
           case 0:
               // Set image to 3D
               imageView.image = UIImage(named: imageDataModel.image3DName)
           case 1:
               // Set image to 2D
               imageView.image = UIImage(named: imageDataModel.image2DName)
           default:
               break
           }
       }
   }

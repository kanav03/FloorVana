//
//  ViewController.swift
//  imageCapture
//
//  Created by Navdeep on 14/11/24.
//

import UIKit

class ImageCaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Outlet for the UIImageView to display the captured or uploaded image
    @IBOutlet weak var imageView: UIImageView!
    
    // Property to store the captured or uploaded image temporarily
    private var selectedImage: UIImage?

    override func viewDidLoad() {

        super.viewDidLoad()
    }
    
    // MARK: - Capture Button Action - Opens the camera
    @IBAction func captureImage(_ sender: UIButton) {
        openImagePicker(sourceType: .camera)
    }

    // MARK: - Upload Button Action - Opens the photo library
    @IBAction func uploadImage(_ sender: UIButton) {
        openImagePicker(sourceType: .photoLibrary)
    }
    
    // MARK: - Continue Button Action
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        guard let imageToSave = selectedImage else {
            showAlert("No Image", message: "Please capture or upload an image before continuing.")
            return
        }
        
        // Save image to data model
        ImageModel.saveImage(imageToSave)
        
        // Show success alert and navigate to D3Output screen
        showAlert("Image Saved", message: "Your image has been successfully saved.") { [weak self] in
            self?.navigateToD3OutputScreen()
        }
    }
    
    // MARK: - Image Picker Handling
    func openImagePicker(sourceType: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            showAlert("Unavailable", message: "This feature is not available on your device.")
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Called when an image is selected or captured
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image // Display image in UIImageView
            selectedImage = image   // Store the image temporarily to save on "Continue"
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation to D3Output Screen
    private func navigateToD3OutputScreen() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let d3OutputVC = mainStoryboard.instantiateViewController(withIdentifier: "D3Output")
        navigationController?.pushViewController(d3OutputVC, animated: true)
    }
    
    // MARK: - Helper Method for Showing Alerts with Completion
    private func showAlert(_ title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true)
    }
}

//
//  OptionsViewController.swift
//  FloorVana
//
//  Created by admin34 on 14/11/24.
//

import UIKit

class OptionsViewController: UIViewController {
    
    @IBOutlet weak var genButton: UIButton!
    
    
    @IBOutlet weak var Upload: UIButton!
    
    
    @IBAction func genButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
            tabBarController.modalPresentationStyle = .fullScreen
            tabBarController.selectedIndex = 1
            self.present(tabBarController, animated: true, completion: nil)
        }
    }
    

    @IBAction func Upload(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the view controller with identifier "capture"
        if let captureVC = mainStoryboard.instantiateViewController(withIdentifier: "capture") as? ImageCaptureViewController {
            // Set modal presentation style to full screen
            captureVC.modalPresentationStyle = .fullScreen
            
            // Add a custom back button to dismiss the view controller
            captureVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissCaptureVC))
            
            // Present modally within a navigation controller
            let navController = UINavigationController(rootViewController: captureVC)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        }
    }

    // Dismiss the capture view controller
    @objc func dismissCaptureVC() {
        dismiss(animated: true, completion: nil)
    }

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

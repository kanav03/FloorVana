//
//  LogInViewController.swift
//  AppStore
//
//  Created by Rudra Pruthi on 02/11/24.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var Login: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if users.contains(where: { $0.Username == email.text! && $0.Password == password.text! }){
//            performSegue(withIdentifier: "loginSuccess", sender: self)
//            let homeScreen = UIStoryboard(name: "Main", bundle: nil)
//            if let homeScreenVC = homeScreen.instantiateViewController(withIdentifier: "MyProjects") as? myProjectViewController {
//                homeScreenVC.modalPresentationStyle = .fullScreen
//                self.present(homeScreenVC, animated: true, completion: nil)
//            }
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            if let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
                tabBarController.modalPresentationStyle = .fullScreen
                tabBarController.selectedIndex = 2
                self.present(tabBarController, animated: true, completion: nil)
            }
            let alert = UIAlertController(
                title: "Segue",
                message: "Segue Success.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }else {
            let alert = UIAlertController(
                title: "User Not Found",
                message: "Please check your username and password or sign up.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
            
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



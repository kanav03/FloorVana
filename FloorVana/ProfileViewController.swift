//
//  ProfileViewController.swift
//  AppStore
//
//  Created by Navdeep    on 01/11/24.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var deleteAccountLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "Navdeep"
        emailLabel.text = "navdeep@gmail.com"
        phoneLabel.text = "9876543210"
    }
    
   
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        
        print("Logout button tapped")
        
    }
}


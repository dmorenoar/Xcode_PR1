//
//  LoginViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!

    // BEGIN-UOC-2
    @IBAction func loginTapped(_ sender: UIButton) {
        
        if Services.validate(username: usernameField.text ?? " ", password: passwordField.text ?? " "){
            performSegue(withIdentifier: "SegueToAuthentication", sender: self)
        }else{
            Utils.show(Message: "Sorry, the username and password are invalid", WithTitle: "Login Error", InViewController: self)
        }
        
    }
    // END-UOC-2
    
    // BEGIN-UOC-5

    // END-UOC-5
    
    // BEGIN-UOC-6

    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}

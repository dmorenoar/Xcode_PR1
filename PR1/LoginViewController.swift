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
    /*Controlamos en el viewWillAppear que si el usuario vuelve a la vista de login, tanto usuario como password no se le muestre evitando fallos de seguridad. Cómo la vista ya esta creada y su viewDidLoad se ha ejecutado y creado la vista, la siguiente fase en el ciclo de vida será el viewWillAppear*/
    override func viewWillAppear(_ animated: Bool) {
        usernameField.text = ""
        passwordField.text = ""
    }
    // END-UOC-5
    
    // BEGIN-UOC-6
    /*En la carga inicial de la view, controlamos que según la hora se muestre un mensaje personalizado y color fondo de pantalla determinado*/
    override func viewDidLoad() {
        
        let hour = Calendar.current.component(.hour, from: Date())

        if hour >= 6 && hour <= 11{
            welcomeLabel.text = "Good morning"
            self.view.backgroundColor = UIColor.orange.lighter()
        }else if hour >= 12 && hour <= 17 {
            welcomeLabel.text = "Good afternoon"
            self.view.backgroundColor = UIColor.yellow.lighter()
        }else if hour >= 18 && hour <= 21 {
            welcomeLabel.text = "Good evening"
            self.view.backgroundColor = UIColor.red.lighter()
        }else {
            welcomeLabel.text = "Good night"
            self.view.backgroundColor = UIColor.blue.lighter()
        }

    }
    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}

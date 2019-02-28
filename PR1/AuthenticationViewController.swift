//
//  AuthenticationViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    // BEGIN-UOC-4

    //Definición de los outlets de los fields
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    
    //Array que contiene los IBOutlet de los UITextField
    var arrayFields:[UITextField] = [UITextField]()
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        var code:String = ""
        
        /*Concatenamos los valores de los fields recorriendo el array que los contiene para generar el código introducido por el usuario*/
        for field in arrayFields{
            code += field.text ?? "\u{00a0}"
        }
        
        /*Realizamos la validación del código usando el método validate*/
        if Services.validate(code: code){
            performSegue(withIdentifier: "SegueToMainNavigation", sender: self)
        }else{
            Utils.show(Message: "Sorry, the entered code is not valid", WithTitle: "Code Error", InViewController: self)
        }
        
    }
    
    /*Definimos la función viewDidLoad para que en la carga de la view podamos
     asignar a cada field cómo delegado la propia view y así gestionar su comportamiento*/
    override func viewDidLoad() {
        
        firstField.delegate = self
        secondField.delegate = self
        thirdField.delegate = self
        fourthField.delegate = self
        
        /*Añadimos los fields a un array para gestionar de una forma más cómoda*/
        arrayFields.append(firstField)
        arrayFields.append(secondField)
        arrayFields.append(thirdField)
        arrayFields.append(fourthField)
        
    }
    
    /*Método heredado de UITextFieldDelegate que nos permite gestionar que el usuario únicamente pueda introducir dígitos numéricos en los inputFields */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return Int(string) != nil
    }
    
    
    // END-UOC-4
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

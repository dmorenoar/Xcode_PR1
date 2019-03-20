//
//  CalculatorViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    // BEGIN-UOC-7.1
    
    @IBOutlet weak var initialAmountLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var finalAmountLabel: UILabel!
    @IBOutlet weak var initialAmountSlider: UISlider!
    @IBOutlet weak var interestRateStepper: UIStepper!
    @IBOutlet weak var yearsStepper: UIStepper!
    
    // END-UOC-7.1
    
    
    // BEGIN-UOC-7.2

    @IBAction func changeInitialAmount(_ sender: UISlider) {
        initialAmountLabel.text = "Initial amount: \(Int(sender.value)) €"
        updateFinalAmount()
    }
    
    @IBAction func changeInterestRate(_ sender: UIStepper) {
        let interest = String(format: "%.2f", Double(sender.value))
        interestRateLabel.text = "Interest rate:\(interest)%"
        updateFinalAmount()
    }
    
    @IBAction func changeYearStepper(_ sender: UIStepper) {
        yearsLabel.text = "Years: \(Int(sender.value))"
        updateFinalAmount()
    }
    
    /*Función que actualiza el label Final Amount con el cálculo de initial amount, interest y years usando la función definida en Services calculateFinalAmount que retorna un Double. Se realiza un round para mostrar únicamente 2 decimales.*/
    func updateFinalAmount() {
        let finalAmount = String(format: "%.2f",Services.calculateFinalAmount(ForAmount: initialAmountSlider.value, WithInterest: (interestRateStepper.value/100), AndYears: yearsStepper.value))
        finalAmountLabel.text = "Final amount: \(finalAmount) €"
    }

    // END-UOC-7.2
    
    
    // BEGIN-UOC-7.3
    /*Añadimos la función viewWillApper para que cuando pulsemos una opción del tabBar y volvamos los valores se restablezcan*/
    override func viewWillAppear(_ animated: Bool) {
        resetValues()
        updateFinalAmount()
    }
    
    /*Al cargar la vista asignamos los valores por defecto*/
    override func viewDidLoad() {
        resetValues()
    }
    
    /*Función que restaura los valores del initial amount, interest y years*/
    func resetValues(){
        initialAmountLabel.text = "Initial amount: \(Int(initialAmountSlider.minimumValue)) €"
        initialAmountSlider.value = 100
        let interest = String(format: "%.2f", Double(interestRateStepper.minimumValue))
        interestRateLabel.text = "Interest rate:\(interest)%"
        yearsLabel.text = "Years: \(Int(yearsStepper.minimumValue))"
    }
    
    // END-UOC-7.3
}

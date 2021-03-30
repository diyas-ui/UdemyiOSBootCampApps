//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func heightChanged(_ sender: UISlider) {
        let heightNumber = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightNumber)m"
    }
    

    @IBAction func weightChanged(_ sender: UISlider) {
        let weightNumber = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightNumber)kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton){
       
        calculateBmi()
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    func calculateBmi(){
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}


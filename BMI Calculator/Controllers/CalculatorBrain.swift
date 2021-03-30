//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by mac on 10/13/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
        } else if bmiValue > 24.9{
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
        
    }
    func getBMIValue() -> String{
        let bmiValue = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiValue
    }
    func getAdvice()-> String{
        return bmi?.advice ?? "Nothing"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
}

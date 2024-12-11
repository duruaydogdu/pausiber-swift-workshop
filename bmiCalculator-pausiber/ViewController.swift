//
//  ViewController.swift
//  bmiCalculator-pausiber
//
//  Created by Osman Emre Ömürlü on 10.12.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var weightSlider: UISlider!    
    
    var globalResult = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let value = sender.value
        
        let valueString = String(format: "%.2f", value)
        
        heightLabel.text = "\(valueString)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let value = sender.value
        let valueString = String(format: "%.0f", value)
        weightLabel.text = "\(valueString)kg"
        
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = calculateBmi(height: height, weight: weight)
        print(bmi)
        let formattedBmi = String(format: "%.2f", bmi)
        print(formattedBmi)
        
        
        globalResult = Double(bmi)
        
       // let resultText = "Your BMI result is: \(formattedBmi)"
        
        performSegue(withIdentifier: "goToResultVC",
                     sender: self)
    }
    
    func calculateBmi(height: Float, weight: Float) -> Float {
        let bmiValue = weight / (height * height)
        return bmiValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
        resultVC.valueFloat = globalResult
    }
    
}


//
//  ResultViewController.swift
//  bmiCalculator-pausiber
//
//  Created by Duru Aydoğdu on 11.12.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var recalculateButton: UIButton!
    
    var valueFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formattedValue = String(format: "%.2f", valueFloat)

        valueLabel.text = formattedValue
        changeBackground()
        updateButtonUI()
    }
    
    func updateButtonUI(){
        // recalculateButton.backgroundColor = .magenta
        recalculateButton.setTitle("RECALCULATE", for: .normal)
        recalculateButton.setTitleColor(.white, for: .normal)
    }

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
       // dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func changeBackground() {
        if valueFloat > 25 {
            view.backgroundColor = .red
        } else if valueFloat >= 18.5 && valueFloat < 25 {
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .yellow
        }
        
    }
    
}


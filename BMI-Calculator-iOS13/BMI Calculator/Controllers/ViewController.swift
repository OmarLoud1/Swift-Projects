//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var height: UISlider!
    
    @IBOutlet weak var heightValue: UILabel!
    
    @IBOutlet weak var weightValue: UILabel!
    
    @IBOutlet weak var weight: UISlider!
    
    var bmi = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightSlider(_ sender: UISlider) {
        heightValue.text = (String(format: "%.2f", height.value) + "m")
    }
    
    @IBAction func weigthSlider(_ sender: UISlider) {
        weightValue.text =
           (String( Int(weight.value)) + "kg")
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let h = height.value
        let w = weight.value
        
        bmi = String(format : "%.1f", (w / (h*h)))
        
        self.performSegue(withIdentifier: "go", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go"{
            let destination = segue.destination as! SecondViewController
            destination.bmiValue = bmi
        }
    }
}


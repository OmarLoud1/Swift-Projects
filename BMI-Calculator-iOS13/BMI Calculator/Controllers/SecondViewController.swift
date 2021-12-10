//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Omar Loudghiri on 1/11/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bmiV: UILabel!
    @IBOutlet weak var advice: UILabel!
    
    var bmiValue : String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        bmiV.text = bmiValue
        
    }
    
    @IBAction func recalc(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageOne: UIImageView!
    
    @IBOutlet weak var diceImageTwo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets the left image as the six dice
        diceImageOne.image = #imageLiteral(resourceName: "DiceSix")
        //sets the right image as the two dice
        diceImageTwo.image = #imageLiteral(resourceName: "DiceTwo")
        // Do any additional setup after loading the view.
    }

    @IBAction func rollDie(_ sender: UIButton) {
        //array with all of the dies to choose from
        let dies = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
        
        //chooses a random element from the array
        diceImageOne.image = dies.randomElement()
        diceImageTwo.image = dies.randomElement()
        

        
        print("Button clicked")
    }
    
}


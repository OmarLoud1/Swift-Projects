//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stories = [Story(story:"You see a fork in the road.", choice1:"Take a left.", choice2:"Take a right."), Story(story:"You see a tiger", choice1:"You pet him", choice2:"You pretend to be dead"), Story(story:"You find a chest at the end of a rainbow.", choice1:"You open it", choice2:"You attack the the Leprechaun guarding it")]

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = stories.randomElement()!.story
        choice1Button.setTitle(stories.randomElement()!.choice1, for: .normal)
        choice2Button.setTitle(stories.randomElement()!.choice2, for: .normal)

    }


    @IBAction func choiceMade(_ sender: UIButton) {
    }
}


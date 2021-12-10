//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let story : String
    let choice1 : String
    let choice2 : String
    init(story : String, choice1 : String, choice2 : String) {
        self.story = story
        self.choice1 = choice1
        self.choice2 = choice2
    }
}

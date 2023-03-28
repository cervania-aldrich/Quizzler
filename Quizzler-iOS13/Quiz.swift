//
//  Quiz.swift
//  Quizzler-iOS13
//
//  Created by Aldrich Cervania on 28/03/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Quiz {
    
    let question:String
    let answer:String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
    
}

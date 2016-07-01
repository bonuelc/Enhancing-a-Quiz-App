//
//  QuestionModel.swift
//  TrueFalseStarter
//
//  Created by Christopher Bonuel on 6/30/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import GameKit

struct QuestionModel {
    
    static func questionModel(question question: String, correctAnswer: String, incorrectAnswer1: String,
        incorrectAnswer2: String, incorrectAnswer3: String) -> [String : String] {
        
        let unshuffledOptions: [String] = [correctAnswer, incorrectAnswer1, incorrectAnswer2, incorrectAnswer3]
        let options = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(unshuffledOptions) as! [String]
        
        return [ questionKey: question, option1Key: options[0], option2Key: options[1], option3Key: options[2], option4Key: options[3], answerKey: correctAnswer ]
    }
}
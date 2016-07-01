//
//  MathModel.swift
//  TrueFalseStarter
//
//  Created by Christopher Bonuel on 6/28/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import GameKit

struct MathModel {
    
    static func randomMathEquationDict() -> [String : String] {
        
        let maxOperand = 10
        var maxAnswer: Int
        var operator_: String
        var correctAnswer: Int
        
        let op1 = GKRandomSource.sharedRandom().nextIntWithUpperBound(maxOperand)
        let op2 = GKRandomSource.sharedRandom().nextIntWithUpperBound(maxOperand)
        
        if GKRandomSource.sharedRandom().nextIntWithUpperBound(2) == 0 {
            // addition
            maxAnswer = maxOperand + maxOperand
            operator_ = "+"
            correctAnswer = op1 + op2
        } else {
            // multiplication
            maxAnswer = maxOperand * maxOperand
            operator_ = "*"
            correctAnswer = op1 * op2
        }
        
        var answerOptions: [Int] = []
        while answerOptions.count < 3 { // TODO: get rid of magic number
            let randNum = GKRandomSource.sharedRandom().nextIntWithUpperBound(maxAnswer)
            if randNum != correctAnswer && !(answerOptions.contains(randNum)) { // we don't want duplicate answers
                answerOptions.append(randNum)
            }
        }
        
        answerOptions = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(answerOptions) as! [Int]
        
        return QuestionModel.questionModel(question: "\(op1) \(operator_) \(op2)", correctAnswer: "\(correctAnswer)", incorrectAnswer1: "\(answerOptions[0])", incorrectAnswer2: "\(answerOptions[1])", incorrectAnswer3: "\(answerOptions[2])")
    }
}
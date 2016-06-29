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
        
        var answerOptions: [Int] = [correctAnswer]
        while answerOptions.count < 4 { // TODO: get rid of magic number
            let randNum = GKRandomSource.sharedRandom().nextIntWithUpperBound(maxAnswer)
            if randNum != correctAnswer && !(answerOptions.contains(randNum)) { // we don't want duplicate answers
                answerOptions.append(randNum)
            }
        }
        
        answerOptions = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(answerOptions) as! [Int]
        
        return [questionKey: "\(op1) \(operator_) \(op2)",
                option1Key: "\(answerOptions[0])",
                option2Key: "\(answerOptions[1])",
                option3Key: "\(answerOptions[2])",
                option4Key: "\(answerOptions[3])",
                answerKey: "\(correctAnswer)"
        ]
    }
}
//
//  TriviaModel.swift
//  TrueFalseStarter
//
//  Created by Christopher Bonuel on 6/26/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

let questionKey = "Question"
let answerKey = "Answer"

struct Trivia {
    let trivia: [[String : String]] = [
        [questionKey: "Only female koalas can whistle", answerKey: "False"],
        [questionKey: "Blue whales are technically whales", answerKey: "True"],
        [questionKey: "Camels are cannibalistic", answerKey: "False"],
        [questionKey: "All ducks are birds", answerKey: "True"]
    ]
}
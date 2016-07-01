//
//  TriviaModel.swift
//  TrueFalseStarter
//
//  Created by Christopher Bonuel on 6/26/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import GameKit

let questionKey = "Question"
let option1Key = "Option 1"
let option2Key = "Option 2"
let option3Key = "Option 3"
let option4Key = "Option 4"
let answerKey = "Answer"

struct TriviaModel {
    
    var trivia: [[String : String]]
    let unshuffledTrivia: [[String : String]] = [
        QuestionModel.questionModel(question: "This was the only US President to serve more than two consecutive terms.", correctAnswer: "Franklin D. Roosevelt", incorrectAnswer1: "George Washington", incorrectAnswer2: "Woodrow Wilson", incorrectAnswer3: "Andrew Jackson"),
        QuestionModel.questionModel(question: "Which of the following countries has the most residents?", correctAnswer: "Nigeria", incorrectAnswer1: "Russia", incorrectAnswer2: "Iran", incorrectAnswer3: "Vietnam"),
        QuestionModel.questionModel(question: "In what year was the United Nations founded?", correctAnswer: "1945", incorrectAnswer1: "1918", incorrectAnswer2: "1919", incorrectAnswer3: "1954"),
        QuestionModel.questionModel(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", correctAnswer: "New York City", incorrectAnswer1: "Paris", incorrectAnswer2: "Washington D.C.", incorrectAnswer3: "Boston"),
        QuestionModel.questionModel(question: "What nation produces the most oil?", correctAnswer: "Canada", incorrectAnswer1: "Iran", incorrectAnswer2: "Iraq", incorrectAnswer3: "Brazil"),
        QuestionModel.questionModel(question: "Which country has most recently won consecutive World Cups in Soccer?", correctAnswer: "Italy", incorrectAnswer1: "Brazil", incorrectAnswer2: "Argentina", incorrectAnswer3: "Spain"),
        QuestionModel.questionModel(question: "Which of the following rivers is longest?", correctAnswer: "Yangtze", incorrectAnswer1: "Mississippi", incorrectAnswer2: "Congo", incorrectAnswer3: "Mekong"),
        QuestionModel.questionModel(question: "Which city is oldest?", correctAnswer: "Mexico City", incorrectAnswer1: "Cape Town", incorrectAnswer2: "San Juan", incorrectAnswer3: "Sydney"),
        QuestionModel.questionModel(question: "Which country was the first to allow women to vote in national elections?", correctAnswer: "Poland", incorrectAnswer1: "United States", incorrectAnswer2: "Sweden", incorrectAnswer3: "Senegal"),
        QuestionModel.questionModel(question: "Which of these countries won the most medals in the 2012 Summer Games?", correctAnswer: "Great Britian", incorrectAnswer1: "France", incorrectAnswer2: "Germany", incorrectAnswer3: "Japan")
    ]
    
    init() {
        trivia = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(unshuffledTrivia) as! [[String : String]]
    }
    
    mutating func randomTrivia() -> [String : String]? {
        return self.trivia.popLast()
    }
}

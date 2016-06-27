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
        [questionKey: "This was the only US President to serve more than two consecutive terms.",
            option1Key: "George Washington",
            option2Key: "Franklin D, Roosevelt",
            option3Key: "Woodrow Wilson",
            option4Key: "Andrew Jackson",
            answerKey: "Franklin D, Roosevelt"],
        [questionKey: "Which of the following countries has the most residents?",
            option1Key: "Nigeria",
            option2Key: "Russia",
            option3Key: "Iran",
            option4Key: "Vietnam",
            answerKey: "Nigeria"],
        [questionKey: "In what year was the United Nations founded?",
            option1Key: "1918",
            option2Key: "1919",
            option3Key: "1945",
            option4Key: "1954",
            answerKey: "1945"],
        [questionKey: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
            option1Key: "Paris",
            option2Key: "Washington D.C.",
            option3Key: "New York City",
            option4Key: "Boston",
            answerKey: "New York City"],
        [questionKey: "What nation produces the most oil?",
            option1Key: "Iran",
            option2Key: "Iraq",
            option3Key: "Brazil",
            option4Key: "Canada",
            answerKey: "Canada"],
        [questionKey: "Which country has most recently won consecutive World Cups in Soccer?",
            option1Key: "Italy",
            option2Key: "Brazil",
            option3Key: "Argentina",
            option4Key: "Spain",
            answerKey: "Italy"],
        [questionKey: "Which of the following rivers is longest?",
            option1Key: "Yangtze",
            option2Key: "Mississippi",
            option3Key: "Congo",
            option4Key: "Mekong",
            answerKey: "Yangtze"],
        [questionKey: "Which city is oldest?",
            option1Key: "Mexico City",
            option2Key: "Cape Town",
            option3Key: "San Juan",
            option4Key: "Sydney",
            answerKey: "Mexico City"],
        [questionKey: "Which country was the first to allow women to vote in national elections?",
            option1Key: "Poland",
            option2Key: "United States",
            option3Key: "Sweden",
            option4Key: "Senegal",
            answerKey: "Poland"],
        [questionKey: "Which of these countries won the most medals in the 2012 Summer Games?",
            option1Key: "France",
            option2Key: "Germany",
            option3Key: "Japan",
            option4Key: "Great Britian",
            answerKey: "Great Britian"]
    ]
    
    init() {
        trivia = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(unshuffledTrivia) as! [[String : String]]
    }
    
    mutating func randomTrivia() -> [String : String]? {
        return self.trivia.popLast()
    }
}

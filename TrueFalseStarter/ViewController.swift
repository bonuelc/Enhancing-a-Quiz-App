//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var questionDictionary: [String : String]? = [:]
    var triviaModel = TriviaModel()
    
    var gameSound: SystemSoundID = 0
    var correctAnswerSound: SystemSoundID = 0
    var incorrectAnswerSound: SystemSoundID = 0
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameSounds()
        // Start game
        playGameStartSound()
        displayQuestionAndOptions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestionAndOptions() {
        if let qD = triviaModel.randomTrivia() {
            questionDictionary = qD
            questionField.text = qD["Question"]
            option1Button.setTitle(qD["Option 1"], forState: .Normal)
            option2Button.setTitle(qD["Option 2"], forState: .Normal)
            option3Button.setTitle(qD["Option 3"], forState: .Normal)
            option4Button.setTitle(qD["Option 4"], forState: .Normal)
            playAgainButton.hidden = true
        } else {
            nextRound(true)
        }
    }
    
    func displayScore() {
        // Hide the answer buttons
        option1Button.hidden = true
        option2Button.hidden = true
        option3Button.hidden = true
        option4Button.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let correctAnswer = questionDictionary!["Answer"]
        
        if (sender.currentTitle == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
            playCorrectAnswerSound()
        } else {
            print(questionDictionary)
            print(correctAnswer)
            questionField.text = "Sorry, wrong answer!"
            playIncorrectAnswerSound()
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound(noMoreQuestionsLeft: Bool = false) {
        if questionsAsked == questionsPerRound || noMoreQuestionsLeft {
            // Game is over
            displayScore()
            // Get trivia model with question that were already asked
            triviaModel = TriviaModel()
        } else {
            // Continue game
            displayQuestionAndOptions()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        option1Button.hidden = false
        option2Button.hidden = false
        option3Button.hidden = false
        option4Button.hidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameSounds() {
        let pathToSoundFile1 = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL1 = NSURL(fileURLWithPath: pathToSoundFile1!)
        AudioServicesCreateSystemSoundID(soundURL1, &gameSound)
        
        let pathToSoundFile2 = NSBundle.mainBundle().pathForResource("doh1", ofType: "wav")
        let soundURL2 = NSURL(fileURLWithPath: pathToSoundFile2!)
        AudioServicesCreateSystemSoundID(soundURL2, &incorrectAnswerSound)
        
        let pathToSoundFile3 = NSBundle.mainBundle().pathForResource("roger-doger", ofType: "wav")
        let soundURL3 = NSURL(fileURLWithPath: pathToSoundFile3!)
        AudioServicesCreateSystemSoundID(soundURL3, &correctAnswerSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }
    
    func playIncorrectAnswerSound() {
        AudioServicesPlaySystemSound(incorrectAnswerSound)
    }
}


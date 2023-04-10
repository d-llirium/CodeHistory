////  Game.swift
//  Code History
//
//  Created by Patricia Carlos on 10/04/23.
//  
//

import Foundation

struct Game {
    // MARK: - PROPERTIES
    private(set) var isOver = false
    
    private let questions = Question.allQuestions.shuffled()
    private(set) var currentQuestionIndex = 0
    
    private(set) var guesses = [ Question: Int ]() // user guess for the current answer
    
        // MARK: - api : Application Programming Interface
    var numberOfQuestions: Int {
        questions.count
    }
    var currentQuestion: Question {
        questions[ currentQuestionIndex ]
    }
    var guessCount: (
        correct: Int,
        incorrect: Int
    ) {
        var count: (
            correct: Int,
            incorrect: Int
        ) = ( 0, 0 )
        
        for ( question, guessedIndex ) in guesses {
            if question.correctAnswerIndex == guessedIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count // returns a tuple containing the total number of correct guesses and the number of incorrect guesses
    }
    
    mutating func makeGuessForCurrentQuestion( atIndex index: Int ) {
        guesses[currentQuestion] = index
    }
    mutating func updateGameStatus() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            isOver = true
        }
    }

}

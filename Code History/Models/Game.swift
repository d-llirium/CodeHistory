////  Game.swift
//  Code History
//
//  Created by Patricia Carlos on 10/04/23.
//  
//

import Foundation

struct Game {
    private let questions = Question.allQuestions.shuffled()
    private(set) var currentQuestionIndex = 0
    
    var currentQuestion: Question {
        questions[ currentQuestionIndex ]
    }
    private(set) var guesses = [ Question: Int ]()
    
    mutating func makeGuessForCurrentQuestion( atIndex index: Int ) {
        guesses[currentQuestion] = index
    }
}

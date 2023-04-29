////  GameViewModel.swift
//  Code History
//
//  Created by Patricia Carlos on 22/04/23.
//  
//

import Foundation
import SwiftUI
// 1 An ObservableObject is always a reference type (class) and informs SwiftUI whenever one of its @Published properties will change
class GameViewModel: ObservableObject {
    
    // MARK: - Published properties
    @Published private var game = Game()     //wrapped in the @Published modifier so our GameViewModel can notify any observers when changes are made to it like when a user makes a guess
    
    // MARK: - Internal properties
    var currentQuestion: Question {
        game.currentQuestion
    }
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
    var guessWasMade: Bool {
        if let _ = game.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    var gameIsOver: Bool { 
        game.isOver
    }
    
    // MARK: - Internal Methods
    func makeGuess( atIndex index: Int ) {
        game.makeGuessForCurrentQuestion(
            atIndex: index
        )
    }
    func displayNextScreen() {
        game.updateGameStatus()
    }
    func color(
        forOptionIndex optionIndex: Int
    ) -> Color {
        if let guessedIndex = game.guesses[ currentQuestion ] { // conditional binding
            if guessedIndex != optionIndex {
                return GameColor.main
                
            } else if guessedIndex == currentQuestion.correctAnswerIndex {
                return GameColor.correctGuess
                
            } else {
                return GameColor.incorrectGuess
            }
        } else {
            return GameColor.main
        }
    }
}

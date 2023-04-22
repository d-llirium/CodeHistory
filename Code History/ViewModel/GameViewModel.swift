////  GameViewModel.swift
//  Code History
//
//  Created by Patricia Carlos on 22/04/23.
//  
//

import Foundation
// 1 An ObservableObject is always a reference type (class) and informs SwiftUI whenever one of its @Published properties will change
class GameViewModel: ObservableObject {
    // MARK: - Published properties
    // 2 wrapped in the @Published modifier so our GameViewModel can notify any observers when changes are made to it like when a user makes a guess
    @Published private var game = Game()
   
    // MARK: - Internal properties
    // 3
    var currentQuestion: Question {
       game.currentQuestion
    }
    // 4
    var questionProgressText: String {
      "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
}

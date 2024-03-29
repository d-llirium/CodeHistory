////  ScoreViewModel.swift
//  Code History
//
//  Created by Patricia Carlos on 29/04/23.
//  
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    var percentage: Int {
        ( correctGuesses * 100 / ( correctGuesses + incorrectGuesses ) )
    }
}

////  QuestionView.swift
//  Code History
//
//  Created by Patricia Carlos on 22/04/23.
//  
//

import SwiftUI

struct QuestionView: View {
    let question: Question
    
    var body: some View {
        VStack { // vertical stack || pile
            Text(question.questionText)
                .font(.largeTitle).bold().multilineTextAlignment( .leading )
            Spacer() // occupies all the space where it is
            HStack { // horizontal || Queeu line
                ForEach( 0 ..< question.possibleAnswers.count, id: \.self ) { answerIndex in
                    // Define the view that will be returned for each index
                    Button(
                        action: {
                            print( "Tapped: \(question.possibleAnswers[answerIndex])" )
                        }, label: {
                            ChoiceTextView(
                                choiceText: question.possibleAnswers[answerIndex]
                            )
                        }
                    )
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(
            question: Game().currentQuestion
        )
    }
}

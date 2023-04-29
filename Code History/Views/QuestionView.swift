////  QuestionView.swift
//  Code History
//
//  Created by Patricia Carlos on 22/04/23.
//  
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel: GameViewModel
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
                            print( "Tapped on option with the text: \(question.possibleAnswers[ answerIndex ])" )
                            viewModel.makeGuess( atIndex: answerIndex ) // Update the button’s action configuration to tell the view model that a guess was made.
                        }, label: {
                            ChoiceTextView(
                                choiceText: question.possibleAnswers[answerIndex]
                            )
                        }
                    )
                }
            }
            if viewModel.guessWasMade { // add a button to the bottom of the view if a guess was made
                Button(
                    action: { viewModel.displayNextScreen() },
                    label: { BottomTextView( str: "Next" ) }
                )
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

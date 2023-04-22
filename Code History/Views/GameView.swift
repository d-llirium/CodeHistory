////  ContentView.swift
//  Code History
//
//  Created by Patricia Carlos on 04/02/23.
//

/*
 By default, ContentView acts as the landing page of the app, meaning this is the first user interface we see when we launch the app
 */
import SwiftUI

struct GameView: View
{
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2
    )
    @StateObject var viewModel = GameViewModel()
    var body: some View
    {
        ZStack {
            GameColor.main.ignoresSafeArea() // background color will always be the main color from GameColor struct and won’t change when the user makes a guessz
            VStack { // vertical stack || pile
                Text( viewModel.questionProgressText )
                    .font( .callout ).multilineTextAlignment( .leading )
                    .padding()
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
        .foregroundColor( .white )
    }
}

/*
 generates the preview that we see on the right-hand side of the Editor area
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

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
    @StateObject var viewModel = GameViewModel()
    
    var body: some View
    {
        ZStack {
            GameColor.main.ignoresSafeArea() // background color will always be the main color from GameColor struct and won’t change when the user makes a guessz
            VStack { // vertical stack || pile
                Text( viewModel.questionProgressText )
                    .font( .callout ).multilineTextAlignment( .leading )
                    .padding()
                QuestionView( question: viewModel.currentQuestion )
            }
        }
        .foregroundColor( .white )
        .navigationBarHidden(true) // hide the navigation bar
        .environmentObject(viewModel) // if any value changes, if will re render QuestionView on this view
        .background(
            NavigationLink( // use the gameIsOver property to navigate to the final view that displays the quiz results
                destination: ScoreView(
                    viewModel: ScoreViewModel(
                        correctGuesses: viewModel.correctGuesses,
                        incorrectGuesses: viewModel.incorrectGuesses
                    )
                ),
                isActive: .constant( viewModel.gameIsOver ),
                label: {
                    EmptyView()
                }
            )
        )
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

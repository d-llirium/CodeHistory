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
        .environmentObject(viewModel) // if any value changes, if will re render QuestionView on this view
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

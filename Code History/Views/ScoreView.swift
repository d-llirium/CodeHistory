////  ScoreView.swift
//  Code History
//
//  Created by Patricia Carlos on 29/04/23.
//  
//

import SwiftUI

struct ScoreView: View {
    let viewModel: ScoreViewModel
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Final Score:")
                    .font( .body )
                Text("\(viewModel.percentage)"+"%")
                    .font( .system( size: 50) ).bold()
                    .padding()
                Spacer()
                VStack {
                    HStack {
                        Text("\(viewModel.correctGuesses)")
                        Image(systemName: "checkmark.square.fill")
                            .font(Font.system(size: 30, weight: .bold))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, GameColor.correctGuess)
                    }
                    HStack {
                        Text("\(viewModel.incorrectGuesses)")
                        Image(systemName: "xmark")
                            .font(Font.system(size: 30, weight: .bold))
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(GameColor.incorrectGuess)
                    }
                }.font( .system( size: 30) )

                
                Spacer()
                NavigationLink(
                    destination: GameView(),
                    label: {
                        BottomTextView(
                            str: "Re-take Quiz"
                        )
                    }
                )
            }
        }
        .foregroundColor( .white )
        .navigationBarHidden( true )
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(
            viewModel: ScoreViewModel(
                correctGuesses: 8,
                incorrectGuesses: 2
            )
        )
    }
}

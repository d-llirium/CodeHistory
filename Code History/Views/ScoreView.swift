////  ScoreView.swift
//  Code History
//
//  Created by Patricia Carlos on 29/04/23.
//  
//

import SwiftUI

struct ScoreView: View {
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Final Score:")
                    .font( .body )
                Text("???"+"%")
                    .font( .system( size: 50) ).bold()
                    .padding()
                Spacer()
                VStack {
                    HStack {
                        Text("???")
                            .font( .system( size: 30) )
                        Image(systemName: "checkmark.square.fill")
                            .font(Font.system(size: 30, weight: .bold))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, GameColor.correctGuess)
                    }
                    HStack {
                        Text("???")
                            .font( .system( size: 30) )
                        Image(systemName: "xmark")
                            .font(Font.system(size: 30, weight: .bold))
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(GameColor.incorrectGuess)
                    }
                }
                
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
        ScoreView()
    }
}

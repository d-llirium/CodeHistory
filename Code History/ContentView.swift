////  ContentView.swift
//  Code History
//
//  Created by Patricia Carlos on 04/02/23.
//

/*
 By default, ContentView acts as the landing page of the app, meaning this is the first user interface we see when we launch the app
 */
import SwiftUI

struct ContentView: View
{
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2
    )
    let mainColor = Color( // for background
        red: 20/255, green: 28/255, blue: 58/255
    )
    let accentColor = Color( // for borders
        red: 48/255, green: 105/255, blue: 240/255
    )
    var body: some View
    {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack { // vertical stack || pile
                Text( "1 / 10" ).font( .callout ).multilineTextAlignment( .leading )
                    .padding()
                Text(question.questionText)
                    .font(.largeTitle).bold().multilineTextAlignment( .leading )
                Spacer() // occupies all the space where it is
                HStack { // horizontal || Queeu line
                    Button( action: { print( "Tapped on Choice 1" ) },
                        label: {
                        Text(question.possibleAnswers[0])
                            .font(.body).bold().multilineTextAlignment(.center)
                            .padding().border( accentColor, width: 4 )
                        }
                    )
                    Button( action: { print( "Tapped on Choice 2" ) },
                        label: {
                        Text(question.possibleAnswers[1])
                            .font(.body).bold().multilineTextAlignment(.center)
                            .padding().border( accentColor, width: 4 )
                        }
                    )
                    Button( action: { print( "Tapped on Choice 3" ) },
                        label: {
                        Text(question.possibleAnswers[2])
                            .font(.body).bold().multilineTextAlignment(.center)
                            .padding().border( accentColor, width: 4 )
                        }
                    )
                    Button( action: { print( "Tapped on Choice 4" ) },
                        label: {
                        Text(question.possibleAnswers[0])
                            .font(.body).bold().multilineTextAlignment(.center)
                            .padding().border( accentColor, width: 4 )
                        }
                    )
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
        ContentView()
    }
}

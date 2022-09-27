//
//  ContentView.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct ChuckNorrisView: View {
    @StateObject private var chuckNorris = ChuckNorris()
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Image("chuckNorris")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .yellow, radius: 10)
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .shadow(color: .yellow, radius: 10)
                    .overlay(
                        JokeView(chuckNorris: chuckNorris)
                    )
                RefreshJokeButtonView(chuckNorris: chuckNorris)
                    .padding()
            }
            .task {
                await chuckNorris.fetchJoke()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("Chuck Norris Jokes")
                        .navigationFontTitle
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChuckNorrisView()
    }
}

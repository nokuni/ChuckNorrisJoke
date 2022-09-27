//
//  RefreshJokeButtonView.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct RefreshJokeButtonView: View {
    @ObservedObject var chuckNorris: ChuckNorris
    var body: some View {
        Button(action: {
            Task {
                await chuckNorris.fetchJoke()
            }
        }) {
            Text("Another joke ?")
                .fontWeight(.semibold)
                .font(.title3)
                .foregroundColor(.white)
                .padding()
                .background(Color.purple.cornerRadius(5))
        }
    }
}

struct RefreshJokeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshJokeButtonView(chuckNorris: ChuckNorris())
    }
}

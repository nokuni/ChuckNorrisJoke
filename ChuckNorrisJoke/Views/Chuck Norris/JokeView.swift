//
//  JokeView.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct JokeView: View {
    @ObservedObject var chuckNorris: ChuckNorris
    var body: some View {
        if let joke = chuckNorris.joke {
            Text(joke.value)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
        } else {
            ProgressView()
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView(chuckNorris: ChuckNorris())
    }
}

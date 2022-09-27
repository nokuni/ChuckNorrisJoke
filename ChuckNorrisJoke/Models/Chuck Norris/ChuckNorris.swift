//
//  ChuckNorris.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import Foundation

class ChuckNorris: ObservableObject {
    @Published var joke: ChuckNorrisJoke?
    
    func fetchJoke() async {
        let apiManager = await APIManager()
        let url = URL(string: "https://api.chucknorris.io/jokes/random")
        let fetchedJoke = try? await apiManager.request(url: url, httpMethod: .get, cachePolicy: .useProtocolCachePolicy, model: ChuckNorrisJoke.self)
        DispatchQueue.main.async {
            self.joke = fetchedJoke
        }
    }
}

struct ChuckNorrisJoke: Codable {
    let value: String
}

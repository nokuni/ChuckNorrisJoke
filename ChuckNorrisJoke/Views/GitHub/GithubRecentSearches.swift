//
//  GithubRecentSearches.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct GithubRecentSearches: View {
    @ObservedObject var github: GitHub
    var body: some View {
        Form {
            Section("Recent Searched") {
                ForEach(github.namesTapped, id: \.self) { name in
                    Button(action: {
                        Task {
                            await github.fetchProfile()
                        }
                    }) {
                        Text(name)
                    }
                }
                .onDelete { indexSet in
                    github.namesTapped.remove(atOffsets: indexSet)
                }
            }
        }
    }
}

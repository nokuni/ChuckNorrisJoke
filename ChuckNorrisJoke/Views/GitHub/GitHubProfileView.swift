//
//  GitHubProfileView.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct GitHubProfileView: View {
    @EnvironmentObject var github: GitHub
    var body: some View {
        NavigationView {
            VStack {
                SearchGithubUserView(github: github)
                GithubRecentSearches(github: github)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("GitSearch")
                        .navigationFontTitle
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if github.profile == nil {
                        Button(action: {
                            github.namesTapped.removeAll()
                        }) {
                            Text("Clear Searches")
                                .foregroundColor(.accentColor)
                        }
                    }
                }
            }
        }
    }
}

struct GitHubProfileView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubProfileView()
            .environmentObject(GitHub())
    }
}

struct GithubUserProfileView: View {
    var github: GitHub
    var body: some View {
        VStack {
            if let profile = github.profile {
                GithubUserHeaderInfo(github: github)
                GithubUserFooterInfo(profile: profile)
            }
        }
    }
}

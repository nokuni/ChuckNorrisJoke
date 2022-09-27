//
//  SearchGithubUserView.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct SearchGithubUserView: View {
    @ObservedObject var github: GitHub
    var body: some View {
        SearchUserButtonView(github: github)
            .searchable(text: $github.username, prompt: "Username")
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .alert(github.searchError?.title ?? "Unknown Error", isPresented: $github.hasFetchedFailed) {
                Button("OK", role: .cancel) {
                    github.username = ""
                }
            } message: {
                Text(github.searchError?.message ?? "An unknown error has occured.")
            }
    }
}

struct SearchGithubUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGithubUserView(github: GitHub())
    }
}

struct SearchUserButtonView: View {
    @ObservedObject var github: GitHub
    var body: some View {
        Button(action: {
            Task {
                await github.fetchProfile()
            }
        }) {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color("BlackNWhite"))
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                .shadow(color: .gray, radius: 2)
                .overlay(
                    Text("Search")
                        .fontWeight(.semibold)
                        .font(.title)
                        .foregroundColor(.primary)
                )
        }
    }
}

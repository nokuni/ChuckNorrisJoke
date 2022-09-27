//
//  GithubUserHeadProfile.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct GithubUserHeaderInfo: View {
    @ObservedObject var github: GitHub
    var body: some View {
        VStack {
            HStack {
                
                if let login = github.profile?.login {
                    Text(login)
                        .navigationFontTitle
                }
                
                Spacer()
                
                Button(action: {
                    DispatchQueue.main.async {
                        self.github.isShowingUserProfile = false
                    }
                }) {
                    Text("Close")
                }
            }
            .padding(.horizontal)
            
            if let imageURL = github.profile?.avatar_url {
                GitHubProfilePictureView(imageURL: imageURL)
            }
            
            if let name = github.profile?.name {
                Text("\(name)")
                    .fontWeight(.semibold)
                    .font(.title3)
            }
        }
    }
}

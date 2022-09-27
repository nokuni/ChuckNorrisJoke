//
//  GithubUserInfo.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct GithubUserFooterInfo: View {
    var profile: GitHubProfile
    var body: some View {
        Form {
            if let bio = profile.bio {
                Section("Bio") {
                    Text(bio)
                }
            }
            
            if let followers = profile.followers {
                Section("Followers") {
                    Text("\(followers)")
                }
            }
            
            if let reposCount = profile.public_repos {
                Section("Repos count") {
                    Text("\(reposCount)")
                }
            }
        }
    }
}

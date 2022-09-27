//
//  GitHubProfile.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

struct GitHubProfile: Codable {
    var login: String?
    let avatar_url: String?
    let name: String?
    let bio: String?
    let public_repos: Int?
    let followers: Int?
    let message: String?
}

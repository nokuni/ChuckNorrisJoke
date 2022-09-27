//
//  GitHubProfile.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import Foundation

final class GitHub: ObservableObject {
    @Published var username = ""
    @Published var profile: GitHubProfile?
    @Published var namesTapped = [String]()
    @Published var hasFetchedFailed: Bool = false
    @Published var isShowingUserProfile: Bool? = nil
    var searchError: GitSearchError?
    
    enum GitSearchError {
        case searchTextEmpty, invalidCharacters, hasFetchedFailed
        var title: String {
            switch self {
            case .searchTextEmpty:
                return "Empty Search Field"
            case .invalidCharacters:
                return "Invalid Characters"
            case .hasFetchedFailed:
                return "Fetch Failed"
            }
        }
        var message: String {
            switch self {
            case .searchTextEmpty:
                return "The search field is empty."
            case .invalidCharacters:
                return "The username has invalid characters"
            case .hasFetchedFailed:
                return "This username does not exists on Github."
            }
        }
    }
    
    let endPoint = "https://api.github.com/users/"
    
    func manageSearchError() {
        DispatchQueue.main.async {
            if self.username.isEmpty {
                self.searchError = .searchTextEmpty
            } else if self.username.hasInvalidUsername {
                self.searchError = .invalidCharacters
            } else {
                self.searchError = .hasFetchedFailed
            }
            self.hasFetchedFailed = true
        }
    }
    
    func showProfil(_ profile: GitHubProfile) {
        DispatchQueue.main.async {
            self.profile = profile
            if !self.namesTapped.contains(self.username) {
                self.namesTapped.append(self.username)
            }
            self.isShowingUserProfile = true
        }
    }
    
    func fetchProfile() async {
        let apiManager = await APIManager()
        if let url = URL(string: endPoint + "\(username.lowercased())") {
            print(url)
            do {
                let fetchedProfile = try await apiManager.request(url: url, httpMethod: .get, cachePolicy: .useProtocolCachePolicy, model: GitHubProfile.self)
                showProfil(fetchedProfile)
            } catch {
                print(error.localizedDescription)
                manageSearchError()
            }
        } else {
            manageSearchError()
        }
    }
}

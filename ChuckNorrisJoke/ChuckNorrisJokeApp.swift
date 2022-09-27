//
//  ChuckNorrisJokeApp.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

@main
struct ChuckNorrisJokeApp: App {
    @StateObject private var github = GitHub()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(github)
        }
    }
}

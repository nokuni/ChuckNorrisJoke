//
//  MainView.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ChuckNorrisView()
                .tabItem {
                    Image(systemName: "bubble.right.fill")
                    Text("Jokes")
                }
            
            GitHubProfileView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("GitSearch")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

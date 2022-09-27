//
//  GitHubProfilePictureView.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct GitHubProfilePictureView: View {
    var imageURL: String
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: UIScreen.main.bounds.height * 0.15, height: UIScreen.main.bounds.height * 0.15)
                    .shadow(color: .gray, radius: 5)
            case .failure:
                Image(systemName: "multiply")
            @unknown default:
                Image(systemName: "plus")
            }
        }
        .padding()
    }
}

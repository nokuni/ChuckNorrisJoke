//
//  NavigationFontTitleModifier.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

struct NavigationFontTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.largeTitle, design: .default, weight: .bold))
            .foregroundColor(.primary)
    }
}

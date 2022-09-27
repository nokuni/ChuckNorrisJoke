//
//  ViewExtension.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import SwiftUI

extension View {
    var navigationFontTitle: some View {
        modifier(NavigationFontTitleModifier())
    }
}

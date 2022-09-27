//
//  StringExtension.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
    
    public var hasInvalidUsername: Bool {
        let validCharacters = Array("abcdefghijklmnopqrstuvwxyz-0123456789 ")
        guard self.first != "-" else { return true }
        guard self.last != "-" else { return true }
        for character in self {
            if !validCharacters.contains(character) {
                return true
            }
        }
        return false
    }
}

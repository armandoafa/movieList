//
//  SafariView.swift
//  MovieList
//

import SwiftUI

struct MessageText: View {
    
    var text: String
    
    var body: some View {
        Text(self.text)
            .color(.primary)
            .lineLimit(2)
            .font(.headline)
            .padding()
    }
}


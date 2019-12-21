//
//  SafariView.swift
//  MovieList
//

import SwiftUI

struct Featured: View {
    
    @EnvironmentObject private var movieData: MovieHomeData
    
    var body: some View {
        NavigationView {
            ZStack {
                if movieData.isLoading {
                    ActivityIndicatorView()
                } else {
                    List {
                        ForEach(movieData.movies) { row in
                            MovieRow(categoryName: row.categoryName, movies: row.movies)
                                .frame(height: 320)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
                }
                .navigationBarTitle(Text("SwiftUI MovieDB"))
            }
            .tabItemLabel(Text("Featured"))
    }
}

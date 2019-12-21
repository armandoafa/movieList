//
//  SafariView.swift
//  MovieList
//

import SwiftUI

struct MovieRow : View {
    
    var categoryName: String
    var movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(self.categoryName)
                .font(.title)
                .padding(.leading)
            
            ScrollView(showsHorizontalIndicator: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.movies.identified(by: \.title)) { movie in
                        NavigationButton(destination: MovieDetail(movieData: MovieItemData(movieService: MovieStore.shared, movie: movie))) {
                            MovieItem(movie: movie)
                                .frame(width: 300)
                                .padding(.trailing, 20)
                        }
                    }
                }
                .padding(.leading, 20)
            }
        }.padding(.top)
    }
}

#if DEBUG
struct MovieRow_Previews : PreviewProvider {
    static var previews: some View {
        MovieRow(categoryName: "Popular", movies: Movie.fakes)
    }
}
#endif

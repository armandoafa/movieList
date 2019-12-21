//
//  SafariView.swift
//  MovieList
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabbedView {
            Featured()
                .tag(0)
            Search()
                .tag(1)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct Home_Previews : PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(MovieHomeData(movieService: MovieStore.shared, endpoints: Endpoint.allCases))
            .environmentObject(MovieSearchData(movieService: MovieStore.shared))
            .environmentObject(KeyboardData())
            .colorScheme(.dark)

    }
}
#endif

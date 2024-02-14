//
//  MovieList.swift
//  Movieapp
//
//  Created by noor alotibi on 02/08/1445 AH.
//

import SwiftUI
import SwiftData
struct MovieList: View {
    // Allow to look for certain model
    @Query private var movies: [Movie] // fetch
    @State private var isAddMoviePresented: Bool = false
    var body: some View {
        VStack{
            Text("Movie list 🍿🎬")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.trailing)
            MovieListview(movies: movies)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add movie"){
                            isAddMoviePresented = true
                        }
                    }
                })
                .sheet(isPresented: $isAddMoviePresented, content: {
                    NavigationStack{
                        Addmovie()
                    }
                })
        }
    }
}

#Preview {
    NavigationStack{
        MovieList()
    }
        .modelContainer(for: [Movie.self])
}

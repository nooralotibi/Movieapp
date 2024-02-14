//
//  moviedetails.swift
//  Movieapp
//
//  Created by noor alotibi on 03/08/1445 AH.
//

import SwiftUI
import SwiftData

struct moviedetails: View {
    @Environment(\.modelContext) private var context
    let movie: Movie
    @State private var title: String = ""
    @State private var year: Int?
    var body: some View {
        VStack{
            Text("Update Movie")
            Form{
                TextField("Title", text: $title)
                TextField("Year", value: $year , format: .number)
            }.formStyle(.columns)
                    .onAppear{
                        title = movie.title
                        year = movie.year
                    }
                
                Button("Update"){
                    guard let year = year else {return}
                    movie.title = title
                    movie.year = year
                    // save the operation
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                } .background(.blue)
               
                .buttonStyle(.borderedProminent)
                
                .foregroundColor(.white)
                .padding(10)
                
            
           
        }
    }
}
struct Moviedetailcontainer: View {
    @Environment(\.modelContext) private var context
    @State private var movie: Movie?
    var body: some View {
        ZStack{
            if let movie {
                moviedetails(movie: movie)
            }
        }
            .onAppear{
                movie = Movie(title: "soul", year: 2020)
                context.insert(movie!)
            }
    }
}
#Preview {
    Moviedetailcontainer()
        .modelContainer(for: [Movie.self])
}

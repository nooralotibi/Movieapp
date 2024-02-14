//
//  MovieappApp.swift
//  Movieapp
//
//  Created by noor alotibi on 02/08/1445 AH.
//

import SwiftUI

@main
struct MovieappApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MovieList()
            }
           
        }.modelContainer(for: [Movie.self])
    }
}

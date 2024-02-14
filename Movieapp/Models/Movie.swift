//
//  Movie.swift
//  Movieapp
//
//  Created by noor alotibi on 02/08/1445 AH.
//

import Foundation
import SwiftData
// if i want to be unique (@Attribute(.unique)
@Model
final class Movie {
    var title:String
    var year: Int
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}

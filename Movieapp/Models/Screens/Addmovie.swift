//
//  Addmovie.swift
//  Movieapp
//
//  Created by noor alotibi on 02/08/1445 AH.
//

import SwiftUI
import SwiftData
struct Addmovie: View {
    @Environment(\.dismiss) private var dismiss
    //track different changes
    @Environment(\.modelContext) private var context
    @State private var title:String = ""
    @State private var year:Int?
    private var isFormValid: Bool{
        !title.isEmptyOrWhiteSpace && year != nil
    }
    var body: some View {
       Form{
            TextField("Title", text: $title)
            TextField("Year", value:  $year, format: .number)
       } .navigationTitle("Add Movie")
       .toolbar {
           ToolbarItem( placement: .topBarLeading){
               Button("close"){
                   dismiss()
               }
           }
           ToolbarItem( placement: .topBarTrailing){
               Button("Save"){
                 // create movie object
                   let movie = Movie(title: title, year: year!)
                   context.insert(movie) // movie save in db
                   do {
                       try context.save()
                   }catch{
                       print(error.localizedDescription)
                   }
                   dismiss()
               }.disabled(!isFormValid)
           }
       }
    }
}

#Preview {
    NavigationStack{
        Addmovie()
            .modelContainer(for: [Movie.self])
    }
}

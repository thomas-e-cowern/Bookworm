//
//  AddBookView.swift
//  Bookworm
//
//  Created by Thomas Cowern New on 2/24/22.
//

import SwiftUI

struct AddBookView: View {
    // MARK:  Properties
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author Name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    } // MARK:  End of picker
                } // MARK:  End of section
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)

                } // MARK:  End of section
            header: {
                Text("Write a Review")
            }
                
                Section {
                    Button("Save") {
                        
                        let newBook = Book(context: managedObjContext)
                        
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? managedObjContext.save()
                        
                        dismiss()
                    }
                } // MARK:  End of section
            } // MARK:  End of form
            .navigationTitle("Add Book")
        } // MARK:  End of Nav view
    }
}

// MARK:  Preview
struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

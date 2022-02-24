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
                    TextField("Author Name", text: $title)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    } // MARK:  End of picker
                } // MARK:  End of section
                
                Section {
                    TextEditor(text: $review)
                    
                    Picker("Rating", selection: $rating) {
                        ForEach (0..<6) {
                            Text(String($0))
                        }
                    }
                } // MARK:  End of section
            header: {
                Text("Write a Review")
            }
                
                Section {
                    Button("Save") {
                        // add book
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

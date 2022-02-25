//
//  DetailView.swift
//  Bookworm
//
//  Created by Thomas Cowern New on 2/24/22.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    // MARK:  Properties
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var showDeleteAlert: Bool = false
    @State private var showEditBookView: Bool = false
    
    let book: Book
    
    // MARK:  Body
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            } // End of ZStack
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No Review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
        } // MARK:  End of scroll view
        .navigationTitle(book.title ?? "Unkown Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    showEditBookView = true
                } label: {
                    Label("Update this book", systemImage: "pencil.circle")
                }
                .sheet(isPresented: $showEditBookView) {
                    EditBookView()
                }
                Button {
                    showDeleteAlert = true
                } label: {
                    Label("Delete this book", systemImage: "trash")
                }
            }
        }
        .alert("Delete book", isPresented: $showDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {  }
        } message: {
            Text("Are You Sure?")
        }
    }
    
    func deleteBook () {
        managedObjContext.delete(book)
        
        try? managedObjContext.save()
        
        dismiss()
    }
}

// MARK:  Preview
struct DetailView_Previews: PreviewProvider {
    
    static let managedObjContent = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        
        let book = Book(context: managedObjContent)
        book.title = "Test Book"
        book.author = "Test Author"
        book.genre = "Fantasy"
        book.rating = 3
        book.review = "This is a test review or a test book that I am using"
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}

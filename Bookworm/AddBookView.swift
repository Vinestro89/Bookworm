//
//  AddBookView.swift
//  Bookworm
//
//  Created by Vincent Delmaestro on 21/09/2021.
//

import SwiftUI

struct AddBookView: View {
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.presentationMode) var presentationMode
	
	@State private var title = ""
	@State private var author = ""
	@State private var rating = 3
	@State private var genre = ""
	@State private var review = ""
	
	let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Name of book", text: $title)
					TextField("Author's name", text: $author)
					
					Picker("Genre", selection: $genre) {
						ForEach(genres, id:\.self) { genre in
							Text(genre)
						}
					}
				}
				
				Section {
					Picker("Rating", selection: $rating) {
						ForEach(0..<6) {
							Text("\($0)")
						}
					}
					
					TextField("Write a review", text: $review)
				}
				
				Section {
					Button("Save") {
						let newBook = Book(context: self.moc)
						newBook.author = self.author
						newBook.genre = self.genre
						newBook.rating = Int16(self.rating)
						newBook.title = self.title
						newBook.review = review
						
						try? self.moc.save()
						
						self.presentationMode.wrappedValue.dismiss()
					}
				}
			}
			.navigationBarTitle("Add Book")
		}
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

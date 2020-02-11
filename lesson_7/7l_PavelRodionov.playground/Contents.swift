import UIKit

enum BookStoreError: Error, LocalizedError {
    case bookStoreEmpty
    case hasntSuchBook
    
    public var errorDescription: String? {
        switch self {
        case .bookStoreEmpty:
            return "The book store is empty. Please add some books"
        case .hasntSuchBook:
            return "The requested book is missing"
        }
    }
}

struct Book {
    var name: String
    var author: String
}

struct BookStore {
    var books: [String:Book] = [:]
    
    func info(bookName: String) throws -> Book {
        guard !books.isEmpty else {throw BookStoreError.bookStoreEmpty}
        guard let _ = books[bookName] else {throw BookStoreError.hasntSuchBook}
        
        return books[bookName]!
    }
}

var bookStore = BookStore()

//bookStore.books = ["Swift": Book(name: "SWIFT", author: "В.УСОВ")]


let bookName = "JAVA"
do {
    let book = try bookStore.info(bookName: bookName)
    print("book: \(book.name), author: \(book.author)")
} catch let error {
    print(error.localizedDescription)
}


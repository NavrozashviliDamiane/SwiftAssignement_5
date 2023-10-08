// წიგნის კლასის შექმნა
class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool

    init(bookID: Int, title: String, author: String) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = false
    }

    func markAsBorrowed() {
        isBorrowed = true
    }

    func markAsReturned() {
        isBorrowed = false
    }
}

// მესაკუთრის კლასის შექმნა
class Owner {
    var ownerId: Int
    var name: String
    var borrowedBooks: [Book]

    init(ownerId: Int, name: String) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = []
    }

    func borrowBook(book: Book) {
        borrowedBooks.append(book)
        book.markAsBorrowed()
    }

    func returnBook(book: Book) {
        if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            borrowedBooks.remove(at: index)
            book.markAsReturned()
        }
    }
}

// ბიბლიოთეკის კლასის შექმნა
class Library {
    var books: [Book]
    var owners: [Owner]

    init() {
        self.books = []
        self.owners = []
    }

    func addBook(book: Book) {
        books.append(book)
    }

    func addOwner(owner: Owner) {
        owners.append(owner)
    }

    func availableBooks() -> [Book] {
        return books.filter { !$0.isBorrowed }
    }

    func borrowedBooks() -> [Book] {
        return books.filter { $0.isBorrowed }
    }

    func findOwnerByID(ownerId: Int) -> Owner? {
        return owners.first { $0.ownerId == ownerId }
    }

    func booksBorrowedByOwner(owner: Owner) -> [Book] {
        return owner.borrowedBooks
    }

    func allowBorrowing(owner: Owner, book: Book) {
        if !book.isBorrowed {
            owner.borrowBook(book: book)
        } else {
            print("Book is already borrowed.")
        }
    }
}

// ფუნქციის შექმნა რომელიც განახორციელებს მოქმედებებს
func simulateLibrary() {
    // წიგნების შექმნა
    let book1 = Book(bookID: 1, title: "Book 1", author: "Author 1")
    let book2 = Book(bookID: 2, title: "Book 2", author: "Author 2")
    let book3 = Book(bookID: 3, title: "Book 3", author: "Author 3")

    // მესაკუთრეების შექმნა
    let owner1 = Owner(ownerId: 1, name: "Owner 1")
    let owner2 = Owner(ownerId: 2, name: "Owner 2")

    // ბიბლიოთეკის შექმნა
    let library = Library()

    // წიგნების დამატება ბიბლიოთეკაში
    library.addBook(book: book1)
    library.addBook(book: book2)
    library.addBook(book: book3)

    // მესაკუთრეების დამატება ბიბლიოთეკაში
    library.addOwner(owner: owner1)
    library.addOwner(owner: owner2)

    
    
    library.allowBorrowing(owner: owner1, book: book1)
    library.allowBorrowing(owner: owner2, book: book2)

    print("Available books: \(library.availableBooks().count)")
    print("Borrowed books: \(library.borrowedBooks().count)")


    library.findOwnerByID(ownerId: owner1.ownerId)?.returnBook(book: book1)

    print("Available books after return: \(library.availableBooks().count)")
    print("Borrowed books after return: \(library.borrowedBooks().count)")
}

// ტესტ-დრაივი
simulateLibrary()

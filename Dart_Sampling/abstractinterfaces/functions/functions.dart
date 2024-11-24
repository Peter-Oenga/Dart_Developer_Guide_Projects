import 'dart:async';

// Enum for book genres
enum Genre { Fiction, NonFiction, Mystery, ScienceFiction, Biography }

// Class representing a Book
class Book {
  final String title;
  final String author;
  final Genre genre;
  final String isbn;
  bool isBorrowed = false;

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.isbn,
  });

  @override
  String toString() {
    return 'Book: $title by $author [${genre.name}], ISBN: $isbn';
  }
}

// Class representing a Library Member
class Member {
  final String name;
  final int id;
  final List<Book> borrowedBooks = [];

  Member({required this.name, required this.id});

  void borrowBook(Book book) {
    if (book.isBorrowed) {
      print('$name: Sorry, the book "${book.title}" is already borrowed.');
    } else {
      book.isBorrowed = true;
      borrowedBooks.add(book);
      print('$name borrowed "${book.title}".');
    }
  }

  void returnBook(Book book) {
    if (borrowedBooks.contains(book)) {
      book.isBorrowed = false;
      borrowedBooks.remove(book);
      print('$name returned "${book.title}".');
    } else {
      print('$name: Cannot return a book not borrowed.');
    }
  }

  @override
  String toString() {
    return 'Member: $name (ID: $id)';
  }
}

// Library class to manage books and members
class Library {
  final List<Book> books = [];
  final List<Member> members = [];

  void addBook(Book book) {
    books.add(book);
    print('Added book: ${book.title}');
  }

  void registerMember(Member member) {
    members.add(member);
    print('Registered member: ${member.name}');
  }

  List<Book> searchBooksByGenre(Genre genre) {
    return books.where((book) => book.genre == genre && !book.isBorrowed).toList();
  }

  List<Book> searchBooksByAuthor(String author) {
    return books.where((book) => book.author.toLowerCase() == author.toLowerCase() && !book.isBorrowed).toList();
  }

  void printAvailableBooks() {
    final availableBooks = books.where((book) => !book.isBorrowed).toList();
    if (availableBooks.isEmpty) {
      print('No books available.');
    } else {
      print('Available Books:');
      for (var book in availableBooks) {
        print(' - ${book.title} by ${book.author}');
      }
    }
  }
}

// Generic class for managing a collection
class CollectionManager<T> {
  final List<T> items = [];

  void addItem(T item) {
    items.add(item);
    print('Item added: $item');
  }

  void removeItem(T item) {
    if (items.remove(item)) {
      print('Item removed: $item');
    } else {
      print('Item not found in collection.');
    }
  }

  List<T> getItems() {
    return items;
  }
}

// Extension on String for basic utilities
extension StringExtensions on String {
  String toTitleCase() {
    return split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}

// Simulate asynchronous operations
Future<void> simulateDelay(String message) async {
  print('Processing: $message');
  await Future.delayed(Duration(seconds: 2));
  print('Completed: $message');
}

// Main Function
void main() async {
  // Create a library instance
  var library = Library();

  // Add books to the library
  library.addBook(Book(title: 'The Catcher in the Rye', author: 'J.D. Salinger', genre: Genre.Fiction, isbn: '1234567890'));
  library.addBook(Book(title: 'A Brief History of Time', author: 'Stephen Hawking', genre: Genre.ScienceFiction, isbn: '0987654321'));
  library.addBook(Book(title: 'To Kill a Mockingbird', author: 'Harper Lee', genre: Genre.Fiction, isbn: '1122334455'));

  // Register members
  var member1 = Member(name: 'Alice Johnson', id: 101);
  var member2 = Member(name: 'Bob Smith', id: 102);
  library.registerMember(member1);
  library.registerMember(member2);

  // Borrow and return books
  member1.borrowBook(library.books[0]);
  member1.borrowBook(library.books[1]);
  member1.returnBook(library.books[0]);
  member2.borrowBook(library.books[0]);

  // Search books by genre
  var scienceBooks = library.searchBooksByGenre(Genre.ScienceFiction);
  print('Science Fiction Books: ${scienceBooks.map((b) => b.title).join(', ')}');

  // Asynchronous simulation
  await simulateDelay('Loading library data');

  // Test extensions
  var title = 'the great gatsby'.toTitleCase();
  print('Formatted title: $title');

  // Use generic collection manager
  var manager = CollectionManager<Book>();
  manager.addItem(library.books[2]);
  manager.removeItem(library.books[2]);

  // Display available books
  library.printAvailableBooks();
}

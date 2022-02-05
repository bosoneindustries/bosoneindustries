import 'package:flutter/material.dart';

void main() {
  runApp(const BooksApp());
}

//class Book
class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

//Main BooksApp Stateful Widget
class BooksApp extends StatefulWidget {
  const BooksApp({Key? key}) : super(key: key);

  @override
  State<BooksApp> createState() => _BooksAppState();
}

//State Class
class _BooksAppState extends State<BooksApp> {
  late Book? _selectedBook = null;
  bool show404 = false;

  // Book List
  List<Book> books = [
    Book('Left hand of darkness', 'Ursula'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Butler'),
  ];
  @override
  void initState() {
    super.initState();
  }

  //handle tap function
  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('BookListspage'),
            child: BookListScreen(
              books: books,
              onTapped: _handleBookTapped,
            ),
          ),
          if (_selectedBook != null) BookDetailsPage(book: _selectedBook)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          setState(() {
            _selectedBook = null;
          });
          return true;
        },
      ),
    );
  }
}

class BookListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;
  BookListScreen({required this.books, required this.onTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}

class BookDetailsPage extends Page {
  final Book? book;

  BookDetailsPage({
    required this.book,
  }) : super(key: ValueKey(book));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return BookDetailsScreen(
            book: book,
          );
        });
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book? book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (book != null) ...[
              Text(
                book!.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                book!.author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class BookRoutePath {
  final int id;
  final bool isUnknown;

  BookRoutePath.me();

  BookRoutePath.home()
      : id = null,
        isUnknown = false;

  BookRoutePath.details(this.id) : isUnknown = false;

  BookRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

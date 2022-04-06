import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  const BookView(this.bookId, {Key? key}) : super(key: key);

  final int bookId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Book #$bookId'),
      ),
    );
  }
}

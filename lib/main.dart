import 'package:book_db/screens/book_detail.dart';
import 'package:book_db/screens/book_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book DB',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const BookSearch(),
      getPages: [
        GetPage(name: '/book-detail/:isbn', page: () => const BookDetail()),
      ],
    );
  }
}

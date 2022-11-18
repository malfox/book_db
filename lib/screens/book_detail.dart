import 'package:book_db/components/book_detail_row.dart';
import 'package:book_db/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? isbn = Get.parameters['isbn'];
    if (isbn == null) Get.back();
    return FutureBuilder(
      future: BookProvider().find(isbn!),
      builder: (context, snapshot) => snapshot.hasData
          ? Scaffold(
              appBar: AppBar(
                title: const Text('Book detail'),
              ),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  BookDetailRow(
                    title: 'title',
                    value: snapshot.data!.title,
                  ),
                  BookDetailRow(
                    title: 'subtitle',
                    value: snapshot.data!.subtitle,
                  ),
                  BookDetailRow(
                    title: 'publisher',
                    value: snapshot.data!.publisher,
                  ),
                  BookDetailRow(
                    title: 'isbn10',
                    value: snapshot.data!.isbn10,
                  ),
                  BookDetailRow(
                    title: 'isbn13',
                    value: snapshot.data!.isbn13,
                  ),
                  BookDetailRow(
                    title: 'pages',
                    value: snapshot.data!.pages,
                  ),
                  BookDetailRow(
                    title: 'year',
                    value: snapshot.data!.year,
                  ),
                  BookDetailRow(
                    title: 'rating',
                    value: snapshot.data!.rating,
                  ),
                  BookDetailRow(
                    title: 'desc',
                    value: snapshot.data!.desc,
                  ),
                  BookDetailRow(
                    title: 'price',
                    value: snapshot.data!.price,
                  ),
                  BookDetailRow(
                    title: 'url',
                    value: snapshot.data!.url,
                  ),
                  if (snapshot.data!.image != null) Image.network(snapshot.data!.image!),
                ]),
              )),
            )
          : Container(),
    );
  }
}

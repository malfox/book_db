import 'package:book_db/models/book_list_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookListItem extends StatelessWidget {
  final BookListDto book;

  const BookListItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/book-detail/${book.isbn13}'),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (book.image != null)
                Flexible(
                    flex: 2,
                    child: SizedBox(
                      width: 50,
                      height: 75,
                      child: Image.network(
                        book.image!,
                        frameBuilder: (BuildContext context, Widget child, int? frame,
                                bool wasSynchronouslyLoaded) =>
                            wasSynchronouslyLoaded
                                ? child
                                : AnimatedOpacity(
                                    opacity: frame == null ? 0 : 1,
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.easeOut,
                                    child: child,
                                  ),
                        loadingBuilder: (context, child, progress) =>
                            progress == null ? child : const CircularProgressIndicator(),
                      ),
                    )),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title ?? '-',
                        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        book.subtitle ?? '-',
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Text(
                book.price ?? '-',
                style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

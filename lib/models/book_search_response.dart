import 'package:book_db/models/book_list_dto.dart';

class BookSearchResponse {
  String? total;
  String? page;
  List<BookListDto>? books;
  String? error;

  BookSearchResponse.fromJson(Map<String, dynamic> jsonObject) {
    total = jsonObject['total'];
    page = jsonObject['page'];
    books = (jsonObject['books'] as List).map((e) => BookListDto.fromJson(e)).toList();
    error = jsonObject['error'];
  }
}

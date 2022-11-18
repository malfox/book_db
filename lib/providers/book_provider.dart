import 'dart:convert';

import 'package:book_db/models/book_detail_dto.dart';
import 'package:book_db/models/book_search_response.dart';
import 'package:book_db/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookProvider extends GetConnect {
  static const String apiVersion = '1.0';

  static String get apiUrl => 'https://api.itbook.store/';

  Future<BookDetailDto?> find(String isbn13) async {
    try {
      Response response = await get(
        '$apiUrl$apiVersion/books/$isbn13',
      );
      return BookDetailDto.fromJson(jsonDecode(response.bodyString!));
    } catch (e) {
      showToast(e.toString(), Colors.orange);
    }
    return null;
  }

  Future<BookSearchResponse?> findAll(String searchString, {int? page}) async {
    try {
      Response response = await get(
        '$apiUrl$apiVersion/search/$searchString${page != null ? '/$page' : ''}',
      );
      return BookSearchResponse.fromJson(jsonDecode(response.bodyString!));
    } catch (e) {
      showToast(e.toString(), Colors.orange);
    }
    return null;
  }
}

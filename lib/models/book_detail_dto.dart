class BookDetailDto {
  String? error;
  String? title;
  String? subtitle;
  String? authors;
  String? publisher;
  String? isbn10;
  String? isbn13;
  String? pages;
  String? year;
  String? rating;
  String? desc;
  String? price;
  String? image;
  String? url;
  Map<String, dynamic>? pdf;

  BookDetailDto.fromJson(Map<String, dynamic> jsonObject) {
    error = jsonObject['error'];
    title = jsonObject['title'];
    subtitle = jsonObject['subtitle'];
    authors = jsonObject['authors'];
    publisher = jsonObject['publisher'];
    isbn10 = jsonObject['isbn10'];
    isbn13 = jsonObject['isbn13'];
    pages = jsonObject['pages'];
    year = jsonObject['year'];
    rating = jsonObject['rating'];
    desc = jsonObject['desc'];
    price = jsonObject['price'];
    image = jsonObject['image'];
    url = jsonObject['url'];
    pdf = jsonObject['pdf'];
  }
}

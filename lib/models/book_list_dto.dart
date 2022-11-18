class BookListDto {
  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  BookListDto.fromJson(Map<String, dynamic> jsonObject) {
    title = jsonObject['title'];
    subtitle = jsonObject['subtitle'];
    isbn13 = jsonObject['isbn13'];
    price = jsonObject['price'];
    image = jsonObject['image'];
    url = jsonObject['url'];
  }
}
